{
(* type token = ID of string | AUTO | IFACE | INET | STATIC 
             | INTERFACE of string | LOOPBACK | DHCP 
             | ADDRESS | NETMASK | GATEWAY  | IP of string | EOF
*)
  open Parser
  exception Error of string
}


(* Définitions de macro pour les expressions régulières *)
let blanc = [' ' '\t' '\n']
 (* A COMPLETER *)
let ip_nb = ['0'-'9']
            |['1'-'9']['0'-'9']
            |'1'['0'-'9']['0'-'9']
            |'2'['0'-'4']['0'-'9']
            |'2''5'['0'-'5']


let ip = ip_nb '.' ip_nb '.' ip_nb '.' ip_nb

let interfaceg = ['a'-'z''0'-'9']+

(* Règles léxicales *)
rule interface = parse
|  blanc (* Onignore les blancs *)
    { interface lexbuf }
| "auto"
    { AUTO }
| "iface"
    {IFACE}
| "inet"
    {INET}
| "static"
    {STATIC}
| "loopback"
    {LOOPBACK}
| "dhcp"
    {DHCP}
| "address"
    {ADDRESS}
| "netmask"
    {NETMASK}
| "gateway"
    {GATEWAY}
| ip as txt
    {IP txt}
| interfaceg as txt
    {ID txt}
| eof
    { EOF }
| _
{ raise (Error ("Unexpected char: "^(Lexing.lexeme lexbuf)^" at "^(string_of_int (Lexing.lexeme_start
lexbuf))^"-"^(string_of_int (Lexing.lexeme_end lexbuf)))) }