%{


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
%start <unit> is

%%

is :
| i is EOF {()} (* action sémantique associée à une règle de prodution -> dans un premier temps () *)
| EOF {()} 


i : 
| AUTO ID  {()} 
| IFACE ID INET t  {()} 

t : 
| LOOPBACK {()} 
| DHCP  {()} 
| STATIC ADDRESS IP NETMASK IP GATEWAY IP {()} 
