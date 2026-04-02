// JSON value types and parser — ported from rust/crates/runtime/src/json.rs

export const JSON_NULL: u8 = 0;
export const JSON_BOOL: u8 = 1;
export const JSON_NUMBER: u8 = 2;
export const JSON_STRING: u8 = 3;
export const JSON_ARRAY: u8 = 4;
export const JSON_OBJECT: u8 = 5;

export class JsonError {
  constructor(public message: string) {}
  toString(): string {
    return this.message;
  }
}

export class JsonValue {
  kind: u8;
  boolValue: bool;
  numberValue: i64;
  stringValue: string;
  arrayValue: Array<JsonValue>;
  objectKeys: Array<string>;
  objectValues: Array<JsonValue>;

  private constructor(kind: u8) {
    this.kind = kind;
    this.boolValue = false;
    this.numberValue = 0;
    this.stringValue = "";
    this.arrayValue = [];
    this.objectKeys = [];
    this.objectValues = [];
  }

  static Null(): JsonValue {
    return new JsonValue(JSON_NULL);
  }

  static Bool(value: bool): JsonValue {
    const v = new JsonValue(JSON_BOOL);
    v.boolValue = value;
    return v;
  }

  static Number(value: i64): JsonValue {
    const v = new JsonValue(JSON_NUMBER);
    v.numberValue = value;
    return v;
  }

  static String(value: string): JsonValue {
    const v = new JsonValue(JSON_STRING);
    v.stringValue = value;
    return v;
  }

  static Array(values: Array<JsonValue>): JsonValue {
    const v = new JsonValue(JSON_ARRAY);
    v.arrayValue = values;
    return v;
  }

  static Object(keys: Array<string>, values: Array<JsonValue>): JsonValue {
    const v = new JsonValue(JSON_OBJECT);
    v.objectKeys = keys;
    v.objectValues = values;
    return v;
  }

  isNull(): bool {
    return this.kind == JSON_NULL;
  }

  isBool(): bool {
    return this.kind == JSON_BOOL;
  }

  isNumber(): bool {
    return this.kind == JSON_NUMBER;
  }

  isString(): bool {
    return this.kind == JSON_STRING;
  }

  isArray(): bool {
    return this.kind == JSON_ARRAY;
  }

  isObject(): bool {
    return this.kind == JSON_OBJECT;
  }

  asBool(): bool {
    return this.boolValue;
  }

  asI64(): i64 {
    return this.numberValue;
  }

  asStr(): string {
    return this.stringValue;
  }

  asArray(): Array<JsonValue> {
    return this.arrayValue;
  }

  objectGet(key: string): JsonValue | null {
    for (let i = 0; i < this.objectKeys.length; i++) {
      if (this.objectKeys[i] == key) {
        return this.objectValues[i];
      }
    }
    return null;
  }

  objectSet(key: string, value: JsonValue): void {
    for (let i = 0; i < this.objectKeys.length; i++) {
      if (this.objectKeys[i] == key) {
        this.objectValues[i] = value;
        return;
      }
    }
    this.objectKeys.push(key);
    this.objectValues.push(value);
  }

  objectSize(): i32 {
    return this.objectKeys.length;
  }

  render(): string {
    switch (this.kind) {
      case JSON_NULL:
        return "null";
      case JSON_BOOL:
        return this.boolValue ? "true" : "false";
      case JSON_NUMBER:
        return this.numberValue.toString();
      case JSON_STRING:
        return renderString(this.stringValue);
      case JSON_ARRAY: {
        const parts = new Array<string>(this.arrayValue.length);
        for (let i = 0; i < this.arrayValue.length; i++) {
          parts[i] = this.arrayValue[i].render();
        }
        return "[" + parts.join(",") + "]";
      }
      case JSON_OBJECT: {
        const entries = new Array<string>(this.objectKeys.length);
        for (let i = 0; i < this.objectKeys.length; i++) {
          entries[i] = renderString(this.objectKeys[i]) + ":" + this.objectValues[i].render();
        }
        return "{" + entries.join(",") + "}";
      }
      default:
        return "null";
    }
  }

  static parse(source: string): JsonValue {
    const parser = new Parser(source);
    const value = parser.parseValue();
    parser.skipWhitespace();
    if (!parser.isEof()) {
      throw new JsonError("unexpected trailing content");
    }
    return value;
  }
}

function renderString(value: string): string {
  let result = '"';
  for (let i = 0; i < value.length; i++) {
    const ch = value.charCodeAt(i);
    if (ch == 0x22) {
      result += '\\"';
    } else if (ch == 0x5c) {
      result += "\\\\";
    } else if (ch == 0x0a) {
      result += "\\n";
    } else if (ch == 0x0d) {
      result += "\\r";
    } else if (ch == 0x09) {
      result += "\\t";
    } else if (ch == 0x08) {
      result += "\\b";
    } else if (ch == 0x0c) {
      result += "\\f";
    } else if (ch < 0x20) {
      result += "\\u" + padHex(ch);
    } else {
      result += String.fromCharCode(ch);
    }
  }
  result += '"';
  return result;
}

function padHex(value: u32): string {
  const hex = "0123456789abcdef";
  return (
    hex.charAt((value >> 12) & 0xf) +
    hex.charAt((value >> 8) & 0xf) +
    hex.charAt((value >> 4) & 0xf) +
    hex.charAt(value & 0xf)
  );
}

class Parser {
  private source: string;
  private index: i32;

  constructor(source: string) {
    this.source = source;
    this.index = 0;
  }

  parseValue(): JsonValue {
    this.skipWhitespace();
    const ch = this.peek();
    if (ch == 0x6e) return this.parseLiteral("null", JsonValue.Null()); // 'n'
    if (ch == 0x74) return this.parseLiteral("true", JsonValue.Bool(true)); // 't'
    if (ch == 0x66) return this.parseLiteral("false", JsonValue.Bool(false)); // 'f'
    if (ch == 0x22) return JsonValue.String(this.parseString()); // '"'
    if (ch == 0x5b) return this.parseArray(); // '['
    if (ch == 0x7b) return this.parseObject(); // '{'
    if (ch == 0x2d || (ch >= 0x30 && ch <= 0x39)) return JsonValue.Number(this.parseNumber()); // '-' or digit
    if (ch < 0) throw new JsonError("unexpected end of input");
    throw new JsonError("unexpected character: " + String.fromCharCode(ch));
  }

  private parseLiteral(expected: string, value: JsonValue): JsonValue {
    for (let i = 0; i < expected.length; i++) {
      const ch = this.next();
      if (ch != expected.charCodeAt(i)) {
        throw new JsonError("invalid literal: expected " + expected);
      }
    }
    return value;
  }

  private parseString(): string {
    this.expect(0x22); // '"'
    let result = "";
    while (true) {
      const ch = this.next();
      if (ch < 0) throw new JsonError("unterminated string");
      if (ch == 0x22) return result; // '"'
      if (ch == 0x5c) {
        // '\\'
        result += String.fromCharCode(this.parseEscape());
      } else {
        result += String.fromCharCode(ch);
      }
    }
    return result; // unreachable
  }

  private parseEscape(): i32 {
    const ch = this.next();
    if (ch == 0x22) return 0x22; // '"'
    if (ch == 0x5c) return 0x5c; // '\\'
    if (ch == 0x2f) return 0x2f; // '/'
    if (ch == 0x62) return 0x08; // 'b'
    if (ch == 0x66) return 0x0c; // 'f'
    if (ch == 0x6e) return 0x0a; // 'n'
    if (ch == 0x72) return 0x0d; // 'r'
    if (ch == 0x74) return 0x09; // 't'
    if (ch == 0x75) return this.parseUnicodeEscape(); // 'u'
    throw new JsonError("invalid escape sequence");
  }

  private parseUnicodeEscape(): i32 {
    let value: u32 = 0;
    for (let i = 0; i < 4; i++) {
      const ch = this.next();
      if (ch < 0) throw new JsonError("unexpected end of input in unicode escape");
      const digit = hexDigit(ch);
      if (digit < 0) throw new JsonError("invalid unicode escape");
      value = (value << 4) | (digit as u32);
    }
    return value as i32;
  }

  private parseArray(): JsonValue {
    this.expect(0x5b); // '['
    const values = new Array<JsonValue>();
    while (true) {
      this.skipWhitespace();
      if (this.tryConsume(0x5d)) break; // ']'
      values.push(this.parseValue());
      this.skipWhitespace();
      if (this.tryConsume(0x5d)) break; // ']'
      this.expect(0x2c); // ','
    }
    return JsonValue.Array(values);
  }

  private parseObject(): JsonValue {
    this.expect(0x7b); // '{'
    const keys = new Array<string>();
    const values = new Array<JsonValue>();
    while (true) {
      this.skipWhitespace();
      if (this.tryConsume(0x7d)) break; // '}'
      const key = this.parseString();
      this.skipWhitespace();
      this.expect(0x3a); // ':'
      const value = this.parseValue();
      keys.push(key);
      values.push(value);
      this.skipWhitespace();
      if (this.tryConsume(0x7d)) break; // '}'
      this.expect(0x2c); // ','
    }
    return JsonValue.Object(keys, values);
  }

  private parseNumber(): i64 {
    let str = "";
    if (this.tryConsume(0x2d)) str += "-"; // '-'
    while (true) {
      const ch = this.peek();
      if (ch >= 0x30 && ch <= 0x39) {
        str += String.fromCharCode(ch);
        this.index++;
      } else {
        break;
      }
    }
    if (str.length == 0 || str == "-") throw new JsonError("invalid number");
    return I64.parseInt(str);
  }

  private expect(expected: i32): void {
    const actual = this.next();
    if (actual != expected) {
      if (actual < 0) {
        throw new JsonError(
          "expected '" + String.fromCharCode(expected) + "', found end of input"
        );
      }
      throw new JsonError(
        "expected '" +
          String.fromCharCode(expected) +
          "', found '" +
          String.fromCharCode(actual) +
          "'"
      );
    }
  }

  private tryConsume(expected: i32): bool {
    if (this.peek() == expected) {
      this.index++;
      return true;
    }
    return false;
  }

  skipWhitespace(): void {
    while (this.index < this.source.length) {
      const ch = this.source.charCodeAt(this.index);
      if (ch == 0x20 || ch == 0x0a || ch == 0x0d || ch == 0x09) {
        this.index++;
      } else {
        break;
      }
    }
  }

  private peek(): i32 {
    if (this.index >= this.source.length) return -1;
    return this.source.charCodeAt(this.index);
  }

  private next(): i32 {
    if (this.index >= this.source.length) return -1;
    const ch = this.source.charCodeAt(this.index);
    this.index++;
    return ch;
  }

  isEof(): bool {
    return this.index >= this.source.length;
  }
}

function hexDigit(ch: i32): i32 {
  if (ch >= 0x30 && ch <= 0x39) return ch - 0x30; // '0'-'9'
  if (ch >= 0x41 && ch <= 0x46) return ch - 0x41 + 10; // 'A'-'F'
  if (ch >= 0x61 && ch <= 0x66) return ch - 0x61 + 10; // 'a'-'f'
  return -1;
}
