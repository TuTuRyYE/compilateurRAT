module PasseTypeRat : Passe.Passe with type t1 = Ast.AstTds.programme and type t2 = Ast.AstType.programme =
struct

  open Tds
  open Exceptions
  open Ast
  open AstType

  type t1 = Ast.AstTds.programme
  type t2 = Ast.AstType.programme

  let analyser (AstTds.Programme (fonctions,prog)) =

    
end
