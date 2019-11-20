
(* The type of tokens. *)

type token = 
  | STATIC
  | NETMASK
  | LOOPBACK
  | IP of (string)
  | INET
  | IFACE
  | ID of (string)
  | GATEWAY
  | EOF
  | DHCP
  | AUTO
  | ADDRESS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val is: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (unit)
