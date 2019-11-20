%{
type interface = Auto of string | Iface of string ;;

%}


%token <string> ID
%token <string> IP
%token AUTO
%token IFACE 
%token INET 
%token STATIC 
%token LOOPBACK 
%token DHCP 
%token ADDRESS 
%token NETMASK 
%token GATEWAY 
%token EOF

(* Exercice 2 *)
(* Déclarations du type de l'attribut associé à un non terminal *)
(* Dans un premier temps on ignore cet attrobut -> type unit *)
%type <unit> i
%type <unit> t

(* Indication de l'axiom et du type de l'attribut associé à l'axiom *)
(* Dans un premier temps on ignore cet attrobut -> type unit *)
%start <string list * string list> is

%%

is :
| info_i = i l = is EOF {let (la, li) = l in 
                          match info_i with
                          | auto  n -> (n::la, li)
                          | iface n -> (la, n::li) } (* action sémantique associée à une règle de prodution -> dans un premier temps () *)
| EOF {([],[])} 


i : 
| AUTO n=ID  {auto n} 
| IFACE n=ID INET t  {iface n} 

t : 
| LOOPBACK {()} 
| DHCP  {()} 
| STATIC ADDRESS IPNETMASK IP GATEWAY IP {()} 
