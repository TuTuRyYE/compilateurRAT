(* Module de la passe de placement mémoire *)
module PassePlacementRat : Passe.Passe with type t1 = Ast.AstType.programme and type t2 = Ast.AstPlacement.programme =
struct

  open Tds
  open Type
  open Exceptions
  open Ast
  open AstPlacement

  type t1 = Ast.AstType.programme
  type t2 = Ast.AstPlacement.programme

  (* analyse_instruction : int -> string -> AstType.instruction -> int * AstType.instruction *)
  (* Paramètre dep : le déplacement mémoire courant *)
  (* Paramètre reg : le registre courant *)
  (* Paramètre i : L'instruction à placer *)
  (* Réalise le placement mémoire d'une instruction *)
  let rec analyserPlacement_instruction dep reg i =
    match i with
    | AstType.Declaration(e, info_ast) ->
      let t = getTaille (get_type_ast info_ast) in
      modifier_adresse_info dep reg info_ast;
      (t+dep, AstType.Declaration(e, info_ast))
    | AstType.TantQue(e, b) ->
      let nb = analyserPlacement_bloc dep reg b in
      (dep, AstType.TantQue(e, nb))
    | AstType.Conditionnelle(e, bt, be) ->
      let nbt = analyserPlacement_bloc dep reg bt in
      let nbe = analyserPlacement_bloc dep reg be in
      (dep, AstType.Conditionnelle(e, nbt, nbe))
    | _ ->
      (dep, i)


  and analyserPlacement_bloc dep reg li =
    match li with
    | [] -> []
    | i::q ->
      let (ndep, ni) = analyserPlacement_instruction dep reg i in
      ni::(analyserPlacement_bloc ndep reg q)

    
  (* Fonction permettant l'analyse des paramètres d'une fonction
  C'est une fonction à par car on réalise un traitement récursif *)    
  let rec analyserPlacement_param_fonction lp dep =
    match lp with
    | [] -> ()
    | info_ast::q ->
      let t = getTaille (get_type_ast info_ast) in
      modifier_adresse_info (dep-t) "LB" info_ast;
      analyserPlacement_param_fonction q (dep-t)

  (* analyse_fonction : AstType.fonction -> AstPlacement.fonction *)
  (* Paramètre : la fonction à analyser *)
  (* Placement mémoire pour une fonction : 1- Les paramètres, 2- La liste d'instruction (bloc) *)
  let analyserPlacement_fonction (AstType.Fonction(info_ast, lp, li, e)) =
    (* Analyse des paramètres, il faut donner la liste des paramètres mais reverse *)
    analyserPlacement_param_fonction (List.rev lp) 0;

    (* Analyse du bloc, l'enregistrement d'activation demande de commence à 3 LB *)
    let nli = analyserPlacement_bloc 3 "LB" li in
    Fonction(info_ast, lp, nli, e)

  (* analyser : AstType.programme -> AstPlacement.programme*)
  (* Paramètre : le programme  *)
  (* Réalise le placement mémoire de notre programme *)
  let analyser (AstType.Programme(lf, li)) =
    (* On analyse chaque fonction *)
    let nlf = List.map analyserPlacement_fonction lf in
    (* On analyse le bloc principal à partir de 0[SB] *)
    let nli = analyserPlacement_bloc 0 "SB" li in
    Programme(nlf, nli)

end