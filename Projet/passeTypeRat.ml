module PasseTypeRat : Passe.Passe with type t1 = Ast.AstTds.programme and type t2 = Ast.AstType.programme =
struct

  open Tds
  open Exceptions
  open Ast
  open AstType

  type t1 = Ast.AstTds.programme
  type t2 = Ast.AstType.programme

  let rec analyserType_expression e = 
    match e with
    | True -> (True, Boolean)
    | False -> (False, Boolean)
    | Entier i -> (Entier i, Int)
    | Numerateur e -> 
        let (ne, te) = analyserType_expression e in 
        if (est_compatible(te, Int)) then
          (Numerateur ne, Int)
        else Raise(TypeInattendu(e))
    | Denominateur e -> 
        let (ne, te) = analyserType_expression e in 
        if (est_compatible(te, Int)) then
          (Denominateur ne, Int)
        else Raise(TypeInattendu(e))
    | Rationnel (e1, e2) -> 
        let(ne1, te1) = analyserType_expression e1 in 
        let(ne2, te2) = analyserType_expression e2 in
        if est_compatible(te1, Int) && estCompatible(te2, Int) then
          (Rationnel(ne1, ne2),Rat)
        else Raise(TypeInattendu(e))
    | Ident info -> (Ident info, getType info)
    | AppelFonction (le, info) -> 
        let type_param = get_Type_Param info in 
        let nle = List.map analyserType_expression le in 
        let ltype = List.map fst nle in
        let lnle = List.map scd nle in
        if est_compatible(type_param, ltype) then
          (AppelFonction(lnle, info), get_type_Retour info)
        else Raise(TypesParametresInattendus(nle, ltype))
    | Binaire (op, e1, e2) -> 
        let(ne1, te1) = analyserType_expression e1 in
        let(ne2, te2) = analyserType_expression e2 in
        begin 
          match te1, op, te2 with
          | Int, Plus, Int -> (Binaire(PlusInt, ne1, ne2) , Int)
          | Rat, Plus, Rat -> (Binaire(PlusRat, ne1, ne2) , Rat)
          | Int, Mult, Int -> (Binaire(MultInt, ne1, ne2) , Int)
          | Rat, Mult, Rat -> (Binaire(MultRat, ne1, ne2) , Int)
          | Int, Equ, Int -> (Binaire(EquInt, ne1, ne2) , Boolean)
          | Bool, Equ, Bool -> (Binaire(EquBool, ne1, ne2) , Boolean)
          | Int, Inf, Int -> (Binaire(Inf, ne1, ne2) , Boolean)
          | _ -> Raise(TypeBinaireInattendu(op, te1, te2))
        end

  let analyserType_instructions i = 
    match i with 
    | Declaration (t, e, info) ->
        let(ne, te) = analyserType_expression e in 
        if est_Compatible(t, te) then 
          modifier_type t_info
          Declaration(ne, info)
        else Raise(TypeInattendu(t, te))
    | Affectation (e, info) -> 
        let(ne, te) = analyserType_expression e in
        let t = get_Type info in
        if est_Compatible te t then
          Affectation(ne, info)
        else  Raise(TypeInattendu(t, te))
    | Affichage e -> 
        let(ne, te) = analyserType_expression e in 
        begin
        match te with 
        | Int -> AffichageInt ne
        | Rat -> AffichageRat ne
        | Bool -> AffichageBool ne
        | Undefined -> Raise(TypeInattendu(Undefined, te))
        end
    | Conditionnelle(e, bt, be) -> 
        let(ne, te) = analyserType_expression e in 
        if est_Compatible te Bool then
          let nbt = analyserType_bloc bt in 
          let nbe = analyseType_bloc be in
          Conditionnelle(ne, nbt, nbe)
        else Raise(TypeInattendu(Bool, te))
    | TantQue(e, b) -> 
        let(ne, te) = analyserType_expression e in
        if est_Compatible te bool then 
          let nb = analyserType_bloc b in 
          TantQue(ne, nb)
        else Raise(TypeInattendu(Bool, te))


          



  let analyser (AstTds.Programme (fonctions,prog)) = 




end
