open Lexer

let pathRuntest = "../../"
let pathUtop = ""

(* analyse_lexicale : string -> unit *)
(* Vérifie que tous les mots du fichier sont bien des mots clés du langage *)
(* file : string - le chemin d'accès au fichier *)
(* Erreur : si un mot n'est pas reconnu *)
let analyse_lexicale file = 
  let aux lexbuf =
    let token = ref (interface lexbuf) in
    while ((!token) <> EOF)
    do
      token := interface lexbuf
    done
  in aux (Lexing.from_channel (open_in file))

(* TESTS *)
(*
let%test_unit _ = (analyse_lexicale (pathRuntest^"interface.txt"))
let%test_unit _ = (analyse_lexicale (pathRuntest^"interface-echec-syntaxique.txt"))
let%test_unit _ = (analyse_lexicale (pathRuntest^"interface-echec-semantique.txt"))
let%test _ = try 
              let _ = (analyse_lexicale (pathRuntest^"interface-echec-lexical.txt")) in false
            with _ -> true
*)

(* analyse_syntaxique : string -> unit *)
(* Vérifie que le fichier est conforme à la grammaire décrite dans le fichier parser.mly *)
(* file : string - le chemin d'accès au fichier *)
(* Erreur : si le fichier n'est pas conforme à la grammaire *)   
      
let analyse_syntaxique file = 
  let input = open_in file in 
  let filebuf = Lexing.from_channel input in
  let _ = Parser.is Lexer.interface filebuf in
  ()

let%test_unit _ = (analyse_syntaxique (pathRuntest^"interface.txt"))
let%test_unit _ = (analyse_syntaxique (pathRuntest^"interface-echec-semantique.txt"))
let%test _ = try 
                let _ = (analyse_syntaxique (pathRuntest^"interface-echec-syntaxique.txt")) in false
              with _ -> true


(* analyse_semantique : string -> string list * string list *)
(* Vérifie que le fichier est conforme à la grammaire décrite dans le fichier parser.mly *)
(* et renvoie la liste des interfaces déclarées et celles lancées automatiquement *)
(* file : string - le chemin d'accès au fichier *)
(* Erreur : si le fichier n'est pas conforme à la grammaire *)        
(*   
let analyse_semantique file = 
  let input = open_in file in 
  let filebuf = Lexing.from_channel input in
  Parser.is Lexer.interface filebuf 

(* verifier : 'a list -> 'a list -> bool *)
(* Vérifie que les éléments de la première liste sont présents dans la seconde liste *)
let verifier li la =
  List.for_all (fun a -> List.mem a li) la

let%test _ = 
  let (li,la) = analyse_semantique (pathRuntest^"interface.txt") in
  verifier li la
 
let%test _ = 
  let (li,la) = analyse_semantique (pathRuntest^"interface-echec-semantique.txt") in
  not (verifier li la )
*)


