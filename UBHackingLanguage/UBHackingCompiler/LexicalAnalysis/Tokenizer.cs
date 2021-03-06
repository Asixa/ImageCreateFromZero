﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
namespace UBHackingCompiler.Tokenize
{
    public static class Tokenizer
    {
        private static  StreamReader reader;
        private static char peek = ' ';
        private static bool EofReached { get; set; }
        public static int line = 1;
        private static readonly Dictionary<string, Word> key_words = new Dictionary<string, Word>();
        private static void Reserve(Word word) => key_words.Add(word.lexeme, word);
        public static void Read(StreamReader r)
        {
            reader = r;
            Reserve();
        }
        private static  void ReadChar()
        {
            try
            {
                if (-1 == reader.Peek())
                {
                    EofReached = true;
                    return;
                }
                peek = (char)reader.Read();
            }
            catch (Exception e)
            {
                //Debugger.Message(e.Message, ConsoleColor.Blue);
            }
        }

        private static bool ReadChar(char ch)
        {
            if (EofReached) return false;
            ReadChar();
            if (peek != ch) return false;
            peek = ' ';
            return true;
        }

        public static Token Scan()
        {
            //去除空白
            for (; !EofReached; ReadChar())
            {
                if (peek == ' ' || peek == '\t') { }
                else if (peek == '\r')
                {
                    ReadChar();
                    ++line;
                }
                else break;
            }
            if (EofReached) return null;

            //检测注释
            if (peek == '/')
            {
                ReadChar();
                switch (peek)
                {
                    case '/': for (; ; ReadChar()) if (peek == '\r' || peek == '\uffff') return Scan();
                    case '*':
                        for (ReadChar(); ; ReadChar())
                        {
                            switch (peek)
                            {
                                case '\r':
                                    line++;
                                    ReadChar();
                                    break;
                                case '*':
                                    ReadChar();
                                    if (peek == '/')
                                    {
                                        ReadChar();
                                        return Scan();
                                    }
                                    break;
                                case '\uffff':
                                    return Scan();
                            }
                        }
                }
                return new Token('/');
            }

            //操作符
            switch (peek)
            {
                case '&':
                    return ReadChar('&') ? Word.And : new Token('&');
                case '|':
                    return ReadChar('|') ? Word.Or : new Token('|');
                case '=':
                    return ReadChar('=') ? Word.Equal : new Token('=');
                case '!':
                    return ReadChar('=') ? Word.NotEqual : new Token('!');
                case '<':
                    return ReadChar('=') ? Word.Less : new Token('<');
                case '>':
                    return ReadChar('=') ? Word.Greater : new Token('>');
                case '"':
                    var s = "";
                    ReadChar();
                    for (; ; ReadChar())
                    {
                        switch (peek)
                        {
                            case '"':
                                {
                                    ReadChar();
                                    return new String(s);
                                }
                            case '\n':
                                {
                                    //Error("应输入\"\"\"");
                                    ReadChar();
                                    return new String(s);
                                }
                        }
                        s = s + peek;
                    }
            }

            //分析数字
            if (char.IsDigit(peek))
            {
                var val = 0;
                do { val = 10 * val + (peek - '0'); ReadChar(); } while (char.IsDigit(peek));
                if (peek != '.') return new Int(val);

                float float_val = val;
                for (float d = 10; ; d *= 10)
                {
                    ReadChar();
                    if (!char.IsDigit(peek)) break;
                    float_val += (peek - 48) / d;
                }
                return new Float(float_val);
            }

            //分析标识符
            if (char.IsLetter(peek))
            {
                var b = new StringBuilder();
                do
                {
                    b.Append(peek);
                    ReadChar();
                } while (char.IsLetterOrDigit(peek));

                var s = b.ToString();
                if (key_words.ContainsKey(s)) return key_words[s];
                return key_words[s] = new Word(s, Tag.ID);
            }

            //其他符合
            var tok = new Token(peek);
            if (!EofReached) peek = ' ';
            return tok;
        }

        private static void Reserve()
        {
            Reserve(new Word("if", Tag.IF));
            Reserve(new Word("else", Tag.ELSE));
            Reserve(new Word("while", Tag.WHILE));
            Reserve(new Word("do", Tag.DO));
            Reserve(new Word("break", Tag.BREAK));
            Reserve(new Word("print", Tag.PRINT));
            Reserve(new Word("public", Tag.PUBLIC));
            Reserve(new Word("private", Tag.PRIVATE));
            Reserve(new Word("class", Tag.OBJ));
            Reserve(new Word("func", Tag.FUNC));
            Reserve(new Word("let", Tag.LET));
            Reserve(new Word("def", Tag.DEF));
            Reserve(new Word("import", Tag.IMPORT));
            Reserve(new Word("namespace", Tag.NAMESPACE));
            Reserve(new Word("var", Tag.VAR));
            Reserve(new Word("static", Tag.STATIC));
            Reserve(new Word("return", Tag.RETURN));
            Reserve(new Word("as", Tag.AS));

            Reserve(Word.True);
            Reserve(Word.False);
            Reserve(Type.Int);
            Reserve(Type.Char);
            Reserve(Type.Bool);
            Reserve(Type.Float);
            Reserve(Type.String);
        }
    }

    public class Token
    {
        public readonly char tag_value;
        public Token(char tag)
        {
            tag_value = tag;
        }
        public override string ToString() => tag_value.ToString();
    }

    public class Int : Token
    {
        private readonly int value;
        public Int(int val) : base(Tag.INT)
        {
            value = val;
        }
        public override string ToString() => value.ToString();
    }

    public class Word : Token
    {
        public readonly string lexeme;
        public Word(string lexeme, char tag) : base(tag)
        {
            this.lexeme = lexeme;
        }
        public override string ToString() => lexeme;

        public static readonly Word
            And = new Word("&&", Tag.AND),
            Or = new Word("||", Tag.OR),
            Equal = new Word("==", Tag.EQ),
            NotEqual = new Word("!=", Tag.NE),
            Less = new Word("<=", Tag.LE),
            Greater = new Word(">=", Tag.GE),
            Minus = new Word("-", Tag.MINUS),
            True = new Word("true", Tag.TRUE),
            False = new Word("false", Tag.FALSE),
            Not = new Word("!", Tag.NOT);
    }

    public class Float : Token
    {
        private readonly float value;
        public Float(float val) : base(Tag.FLOAT)
        {
            value = val;
        }
        public override string ToString() => value.ToString(System.Globalization.CultureInfo.InvariantCulture);
    }

    public class String : Token
    {
        private readonly string value;
        public String(string val) : base(Tag.STRING)
        {
            value = val;
        }
        public override string ToString() => value;
    }

    public class Type : Word
    {
        public readonly int width;
        public string name_space;

        public Type(string type_name, char tag, int width) : base(type_name, tag)
        {
            this.width = width;
        }

        public static readonly Type
            Void = new Type("void", Tag.BASIC, 1),
            Int = new Type("int", Tag.BASIC, 4),
            Float = new Type("float", Tag.BASIC, 8),
            Char = new Type("char", Tag.BASIC, 1),
            Bool = new Type("bool", Tag.BASIC, 1),
            String = new Type("string", Tag.BASIC, 1);

        private static bool Numeric(Type type) => type == Char || type == Int || type == Float;

        public static Type Max(Type lhs, Type rhs)
        {
            if (lhs == String || rhs == String) return String;

            if (!Numeric(lhs) || !Numeric(rhs)) return null;

            if (lhs == Float || rhs == Float) return Float;

            if (lhs == Int || rhs == Int) return Int;

            return Char;
        }
    }

}

public static class Tag
{
    public const char
        AND = (char)256,
        BASIC = (char)257,
        BREAK = (char)258,
        DO = (char)259,
        ELSE = (char)260,
        EQ = (char)261,
        FALSE = (char)262,
        GE = (char)263,
        ID = (char)264,
        IF = (char)265,
        INDEX = (char)266,
        LE = (char)267,
        MINUS = (char)268,
        NE = (char)269,
        INT = (char)270,
        OR = (char)271,
        FLOAT = (char)272,
        TEMP = (char)273,
        TRUE = (char)274,
        WHILE = (char)275,
        PRINT = (char)276,
        STRING = (char)277,
        PUBLIC = (char)278,
        PRIVATE = (char)279,
        OBJ = (char)280,
        FUNC = (char)281,
        NOT = (char)282,
        LET = (char)283,
        DEF = (char)284,
        IMPORT = (char)285,
        NAMESPACE = (char)286,
        VAR=(char)287,
        STATIC = (char) 288,
        RETURN=(char)289,
        AS = (char) 290;

}
