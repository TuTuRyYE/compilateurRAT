open Hashtbl
open Type

(* Définition du type des informations associées aux identifiants *)
type info =
  | InfoConst of string * int
  | InfoVar of string * typ * int * string
  | InfoFun of string * typ * typ list

(* Données stockées dans la tds  et dans les AST : pointeur sur une information *)
type info_ast = info ref

(* Table des symboles hiérarchique *)
(* Les tables locales sont codées à l'aide d'une hashtable *)
type tds =
  | Nulle
  (* Table courante : la table mère - la table courante *)
  | Courante of tds * (string,info_ast) Hashtbl.t


let info_to_info_ast i = ref i

let info_ast_to_info i = !i

let creerTDSMere () = Courante (Nulle, Hashtbl.create 100)

let creerTDSFille mere = Courante (mere, Hashtbl.create 100)

let ajouter tds nom info =
  match tds with
  | Nulle -> failwith "Ajout dans une table vide"
  | Courante (_,c) -> Hashtbl.add c nom info

let chercherLocalement tds nom =
  match tds with
  | Nulle -> None
  | Courante (_,c) ->  find_opt c nom 

let rec chercherGlobalement tds nom =
  match tds with
  | Nulle -> None
  | Courante (m,c) ->
    match find_opt c nom with
      | Some _ as i -> i
      | None -> chercherGlobalement m nom


let string_of_info info =
  match info with
  | InfoConst (n,value) -> "Constante "^n^" : "^(string_of_int value)
  | InfoVar (n,t,dep,base) -> "Variable "^n^" : "^(string_of_type t)^" "^(string_of_int dep)^"["^base^"]"
  | InfoFun (n,t,tp) -> "Fonction "^n^" : "^(List.fold_right (fun elt tq -> if tq = "" then (string_of_type elt) else (string_of_type elt)^" * "^tq) tp "" )^
                      " -> "^(string_of_type t)


let afficher_locale tds =
  match tds with
  | Nulle -> print_newline ()
  |Courante (_,c) -> Hashtbl.iter ( fun n info -> (print_string (n^" : "^(string_of_info (info_ast_to_info info))^"\n"))) c


let afficher_globale tds =
  let rec afficher tds indent =
    match tds with
    | Nulle -> print_newline ()
    | Courante (m,c) -> if Hashtbl.length c = 0
                        then print_string (indent^"<empty>\n")
                        else Hashtbl.iter ( fun n info -> (print_string (indent^n^" : "^(string_of_info (info_ast_to_info info))^"\n"))) c ; afficher m (indent^"  ")
  in afficher tds ""


  let modifier_type_info t i =
    match !i with
    |InfoVar (n,_,dep,base) -> i:= InfoVar (n,t,dep,base)
    | _ -> failwith "Appel modifier_type_info pas sur un InfoVar"
 
 let modifier_type_fonction_info t tp i =
       match !i with
       |InfoFun(n,_,_) -> i:= InfoFun(n,t,tp)
       | _ -> failwith "Appel modifier_type_fonction_info pas sur un InfoFun"
 
 let modifier_adresse_info d b i =
     match !i with
     |InfoVar (n,t,_,_) -> i:= InfoVar (n,t,d,b)
     | _ -> failwith "Appel modifier_adresse_info pas sur un InfoVar"
    
let get_type info = 
  match info with 
  | InfoConst (_, _) -> Type.Int
  | InfoVar(_, typ, _, _) -> typ
  | InfoFun(_, typ, _) -> typ

let get_type_ast info_ast = 
  let info = info_ast_to_info info_ast in
  (* get_type info *)
  match info with 
  | InfoConst (_, _) -> Type.Int
  | InfoVar(_, typ, _, _) -> typ
  | InfoFun(_, typ, _) -> typ

let get_nom_ast info_ast =
  let info = info_ast_to_info info_ast in
  match info with 
  | InfoVar (nom, _, _, _) -> nom
  | _ -> failwith "get_nom_ast : N'est pas une infovar"
  
let get_addr_ast info_ast =
  let info = info_ast_to_info info_ast in
  match info with 
  | InfoVar (_, _, addr, _) -> addr
  | _ -> failwith "get_addr_ast : N'est pas une infovar"

let get_reg_ast info_ast =
  let info = info_ast_to_info info_ast in
  match info with 
  | InfoVar (_, _, _, reg) -> reg
  | _ -> failwith "get_reg_ast : N'est pas une infovar"

  
  let get_type_fonction_param_ast info_ast =
    let info = info_ast_to_info info_ast in
    match info with 
    | InfoFun (_, _, ts) -> ts
    | _ -> failwith "get_type_fonction_ast : N'est pas une infofun"