(* Module de la passe de génération de code *)
module PasseCodeRatToTam : Passe.Passe with type t1 = Ast.AstPlacement.programme and type t2 = string =
struct

  open Tds
  open Type
  open Exceptions
  open Ast
  open Code
  open AstType

  type t1 = Ast.AstPlacement.programme
  type t2 = string

(* analyserCode_expression : AstPlacement.expression -> string *)
(* Paramètre e : l'expression *)
(* Analyse une expression Rat pour générer son code Tam*)
let rec analyserCode_expression e =
  match e with
  | True -> "LOADL 1\n"
  | False -> "LOADL 0\n"
  | Entier(i) -> "LOADL "^(string_of_int i)^"\n"
  | Ident(info_ast) ->
    "LOAD ("^(string_of_int (getTaille (get_type_ast info_ast)))^") "^(string_of_int (get_addr_ast info_ast))^"["^(get_reg_ast info_ast)^"]\n"
  | Rationnel(e1, e2) ->
    (analyserCode_expression e1)
    ^(analyserCode_expression e2)
  | Numerateur(e) ->
    (analyserCode_expression e)
    ^"POP (0) 1\n"
  | Denominateur(e) ->
    (analyserCode_expression e)
    ^"POP (1) 1\n"
  | Binaire(op, e1, e2) ->
    (analyserCode_expression e1)
    ^(analyserCode_expression e2)
    ^(
      begin
        match op with
        | PlusInt -> "SUBR IAdd\n"
        | PlusRat -> "CALL (SB) RAdd\n"
        | MultInt -> "SUBR IMul\n"
        | MultRat -> "CALL (SB) RMul\n"
        | EquInt -> "SUBR IEq\n"
        | EquBool -> "SUBR BAnd\n"
        | Inf -> "SUBR ILss\n"
      end
    )
  | AppelFonction(info_ast, le) ->
    List.fold_right (fun e q -> (analyserCode_expression e)^q) le ""
    ^"CALL (SB) "^(get_nom_ast info_ast)^"\n"

(* Renvoi la taille d'une instruction *)
  let taille_i i = match i with
    |Declaration(e,info) -> getTaille (get_type_ast info)
    |_ -> 0

    (* Renvoi la taille d'une liste d'instruction *)
  let taille_li li = List.fold_left (fun result instruction -> (taille_i instruction) + result) 0 li

  (* analyserCode_instruction : AstPlacement.expression -> string *)
(* Paramètre e : l'expression *)
(* Analyse une expression Rat pour générer son code Tam*)
  let rec analyserCode_instruction i = match i with
    | Empty -> ""
    | Declaration(e,info) ->
      let taille = string_of_int (getTaille (get_type_ast info)) in
      "PUSH "^taille^"\n"
      ^(analyserCode_expression e)
      ^"STORE ("^taille^") "^(string_of_int (get_addr_ast info))^"["^(get_reg_ast info)^"]\n"
    | Affectation(e, info) ->
      (analyserCode_expression e)
      ^"STORE ("^string_of_int (getTaille (get_type_ast info))^") "^(string_of_int (get_addr_ast info))^"["^(get_reg_ast info)^"]\n"
    | Conditionnelle(e,bt,be) ->
      let etiquetteElse = getEtiquette () in
      let etiquetteFinIf = getEtiquette () in
      (analyserCode_expression e)
      ^"JUMPIF (0) "^etiquetteElse^"\n"
      ^(analyserCode_bloc bt)
      ^"JUMP "^etiquetteFinIf^"\n"
      ^etiquetteElse^"\n"
      ^(analyserCode_bloc be)
      ^etiquetteFinIf^"\n"
    | TantQue(e, b) ->
      let debut = getEtiquette () in
      let fin = getEtiquette () in
      debut^"\n"
      ^(analyserCode_expression e)
      ^"JUMPIF (0) "^fin^"\n"
      ^(analyserCode_bloc b)
      ^"JUMP "^debut^"\n"
      ^fin^"\n"
    | AffichageInt(e) ->
      (analyserCode_expression e)
      ^"SUBR IOut\n"
    | AffichageBool(e) ->
      (analyserCode_expression e)
      ^"SUBR BOut\n"
    | AffichageRat(e) ->
      (analyserCode_expression e)
      ^"CALL (SB) ROut\n"

(* analyserCode_bloce: AstPlacement.bloc -> string *)
(* Paramètre info : Le blocc à traduire *)
(* Analyse un bloc rat pour la traduire en code Tam *)
  and analyserCode_bloc li =
    let tailleLi = (taille_li li) in
    (List.fold_right (fun elem myString -> (analyserCode_instruction elem)^myString) li "")
    ^(
    if (tailleLi > 0) then
      "POP (0) "^(string_of_int tailleLi)^"\n"
    else
      ""
    )

(* analyserCode_fonction : AstPlacement.fonction -> string *)
(* Paramètre info : La fonction à traduire *)
(* Analyse une fonction rat pour la traduire en code Tam *)
  let analyserCode_fonction (Ast.AstPlacement.Fonction(info, linfo_ast, li, e)) =
    get_nom_ast info^"\n"
    ^(analyserCode_bloc li)
    ^(analyserCode_expression e)
    ^(let tailleRetour = getTaille (get_type_ast info) in
      "RETURN (1) "^(string_of_int tailleRetour)^"\n")

  let analyser (Ast.AstPlacement.Programme(fonctions, bloc)) =
    let nfct = List.map analyserCode_fonction fonctions in
    let nbloc = analyserCode_bloc bloc in
    let code =
    (Code.getEntete ())
    ^(List.fold_right (fun elem myString -> elem^myString) nfct "")
    ^"\nmain\n"
    ^nbloc
    ^"HALT\n" in
    Code.ecrireFichier "FichierOutput.tam" code;
    code
end