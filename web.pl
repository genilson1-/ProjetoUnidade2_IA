:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).

:- http_handler(/, say_hi, []).

/* The implementation of /. The single argument provides the request
details, which we ignore for now. Our task is to write a CGI-Document:
a number of name: value -pair lines, followed by two newlines, followed
by the document content, The only obligatory header line is the
Content-type: <mime-type> header.
Printing can be done using any Prolog printing predicate, but the
format-family is the most useful. See format/2.   */

say_hi(_Request) :-
        format('Content-type: text/plain~n~n'),
format('Hello World!~n').
