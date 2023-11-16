local ls = require("luasnip")

ls.snippets.csharp = {
	ls.parser.parse_snippet("cw", "Console.WriteLine($1)"),
}
