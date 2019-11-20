
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | WHILE
    | TRUE
    | SLASH
    | RETURN
    | RAT
    | PV
    | PRINT
    | PO
    | PLUS
    | PF
    | NUM
    | MULT
    | INT
    | INF
    | IF
    | ID of (
# 11 "parser.mly"
       (string)
# 26 "parser.ml"
  )
    | FALSE
    | EQUAL
    | EOF
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 34 "parser.ml"
  )
    | ELSE
    | DENOM
    | CONST
    | CO
    | CF
    | CALL
    | BOOL
    | AO
    | AF
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState87
  | MenhirState80
  | MenhirState78
  | MenhirState74
  | MenhirState72
  | MenhirState67
  | MenhirState62
  | MenhirState51
  | MenhirState48
  | MenhirState46
  | MenhirState45
  | MenhirState42
  | MenhirState40
  | MenhirState37
  | MenhirState34
  | MenhirState31
  | MenhirState28
  | MenhirState22
  | MenhirState17
  | MenhirState16
  | MenhirState13
  | MenhirState12
  | MenhirState8
  | MenhirState7
  | MenhirState5
  | MenhirState4
  | MenhirState3
  | MenhirState0

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 96 "parser.ml"

let rec _menhir_goto_prog : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 41 "parser.mly"
      (programme)
# 101 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (lfi : (
# 41 "parser.mly"
      (programme)
# 117 "parser.ml"
            ))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 52 "parser.mly"
       (Ast.AstSyntax.programme)
# 123 "parser.ml"
            ) = 
# 56 "parser.mly"
                          (lfi)
# 127 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 52 "parser.mly"
       (Ast.AstSyntax.programme)
# 134 "parser.ml"
            )) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (lf : (
# 43 "parser.mly"
      (fonction)
# 149 "parser.ml"
        ))), _, (lfi : (
# 41 "parser.mly"
      (programme)
# 153 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 41 "parser.mly"
      (programme)
# 158 "parser.ml"
        ) = 
# 59 "parser.mly"
                          (let (Programme (lf1,li))=lfi in (Programme (lf::lf1,li)))
# 162 "parser.ml"
         in
        _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_cp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 49 "parser.mly"
      (expression list)
# 171 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (
# 48 "parser.mly"
      (expression)
# 182 "parser.ml"
        ))), _, (le : (
# 49 "parser.mly"
      (expression list)
# 186 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 49 "parser.mly"
      (expression list)
# 191 "parser.ml"
        ) = 
# 103 "parser.mly"
                (e1::le)
# 195 "parser.ml"
         in
        _menhir_goto_cp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (n : (
# 11 "parser.mly"
       (string)
# 210 "parser.ml"
            ))), _, (lp : (
# 49 "parser.mly"
      (expression list)
# 214 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 48 "parser.mly"
      (expression)
# 222 "parser.ml"
            ) = 
# 88 "parser.mly"
                          (AppelFonction (n,lp))
# 226 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_is : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 44 "parser.mly"
      (instruction list)
# 241 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (li : (
# 44 "parser.mly"
      (instruction list)
# 258 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 42 "parser.mly"
      (instruction list)
# 265 "parser.ml"
            ) = 
# 64 "parser.mly"
                          (li)
# 269 "parser.ml"
             in
            let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
            (match _menhir_s with
            | MenhirState40 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((_menhir_stack, _menhir_s), _, (exp : (
# 48 "parser.mly"
      (expression)
# 279 "parser.ml"
                ))), _, (li : (
# 42 "parser.mly"
      (instruction list)
# 283 "parser.ml"
                ))) = _menhir_stack in
                let _1 = () in
                let _v : (
# 45 "parser.mly"
      (instruction)
# 289 "parser.ml"
                ) = 
# 76 "parser.mly"
                                    (TantQue (exp,li))
# 293 "parser.ml"
                 in
                _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v
            | MenhirState46 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | ELSE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | AO ->
                        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState48
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | MenhirState48 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((((_menhir_stack, _menhir_s), _, (exp : (
# 48 "parser.mly"
      (expression)
# 324 "parser.ml"
                ))), _, (li1 : (
# 42 "parser.mly"
      (instruction list)
# 328 "parser.ml"
                ))), _, (li2 : (
# 42 "parser.mly"
      (instruction list)
# 332 "parser.ml"
                ))) = _menhir_stack in
                let _4 = () in
                let _1 = () in
                let _v : (
# 45 "parser.mly"
      (instruction)
# 339 "parser.ml"
                ) = 
# 75 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 343 "parser.ml"
                 in
                _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v
            | MenhirState3 ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, (_1 : (
# 11 "parser.mly"
       (string)
# 352 "parser.ml"
                ))), _, (li : (
# 42 "parser.mly"
      (instruction list)
# 356 "parser.ml"
                ))) = _menhir_stack in
                let _v : (
# 41 "parser.mly"
      (programme)
# 361 "parser.ml"
                ) = 
# 60 "parser.mly"
                          (Programme ([],li))
# 365 "parser.ml"
                 in
                _menhir_goto_prog _menhir_env _menhir_stack _menhir_s _v
            | _ ->
                _menhir_fail ())
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (i1 : (
# 45 "parser.mly"
      (instruction)
# 382 "parser.ml"
        ))), _, (li : (
# 44 "parser.mly"
      (instruction list)
# 386 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 44 "parser.mly"
      (instruction list)
# 391 "parser.ml"
        ) = 
# 68 "parser.mly"
                          (i1::li)
# 395 "parser.ml"
         in
        _menhir_goto_is _menhir_env _menhir_stack _menhir_s _v
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RETURN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState80
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_i : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 45 "parser.mly"
      (instruction)
# 442 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | CONST ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | ID _v ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
    | IF ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | INT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | PRINT ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | RAT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | WHILE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | AF | RETURN ->
        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack) MenhirState67
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67

and _menhir_goto_dp : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 47 "parser.mly"
      ((typ*string) list)
# 476 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (t : (
# 46 "parser.mly"
      (typ)
# 487 "parser.ml"
        ))), (n : (
# 11 "parser.mly"
       (string)
# 491 "parser.ml"
        ))), _, (lp : (
# 47 "parser.mly"
      ((typ*string) list)
# 495 "parser.ml"
        ))) = _menhir_stack in
        let _v : (
# 47 "parser.mly"
      ((typ*string) list)
# 500 "parser.ml"
        ) = 
# 80 "parser.mly"
                          ((t,n)::lp)
# 504 "parser.ml"
         in
        _menhir_goto_dp _menhir_env _menhir_stack _menhir_s _v
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AO ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOL ->
                    _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | CONST ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | ID _v ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
                | IF ->
                    _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | INT ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | PRINT ->
                    _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | RAT ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | WHILE ->
                    _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | RETURN ->
                    _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack) MenhirState78
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_e : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 48 "parser.mly"
      (expression)
# 562 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState17 | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CALL ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | CO ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | DENOM ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | ENTIER _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | FALSE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | NUM ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | PO ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | TRUE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | PF ->
            _menhir_reduce2 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | SLASH ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState22
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 646 "parser.ml"
            ))), _, (e2 : (
# 48 "parser.mly"
      (expression)
# 650 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 48 "parser.mly"
      (expression)
# 658 "parser.ml"
            ) = 
# 89 "parser.mly"
                          (Rationnel(e1,e2))
# 662 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 677 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 48 "parser.mly"
      (expression)
# 683 "parser.ml"
        ) = 
# 91 "parser.mly"
                          (Denominateur e1)
# 687 "parser.ml"
         in
        _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 696 "parser.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : (
# 48 "parser.mly"
      (expression)
# 702 "parser.ml"
        ) = 
# 90 "parser.mly"
                          (Numerateur e1)
# 706 "parser.ml"
         in
        _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
        | INF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
        | MULT ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
        | PLUS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 840 "parser.ml"
            ))), _, (e2 : (
# 48 "parser.mly"
      (expression)
# 844 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 48 "parser.mly"
      (expression)
# 852 "parser.ml"
            ) = 
# 96 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 856 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 877 "parser.ml"
            ))), _, (e2 : (
# 48 "parser.mly"
      (expression)
# 881 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 48 "parser.mly"
      (expression)
# 889 "parser.ml"
            ) = 
# 97 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 893 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 914 "parser.ml"
            ))), _, (e2 : (
# 48 "parser.mly"
      (expression)
# 918 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 48 "parser.mly"
      (expression)
# 926 "parser.ml"
            ) = 
# 99 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 930 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 951 "parser.ml"
            ))), _, (e2 : (
# 48 "parser.mly"
      (expression)
# 955 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (
# 48 "parser.mly"
      (expression)
# 963 "parser.ml"
            ) = 
# 98 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 967 "parser.ml"
             in
            _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AO ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState40
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 999 "parser.ml"
            ))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (
# 45 "parser.mly"
      (instruction)
# 1006 "parser.ml"
            ) = 
# 74 "parser.mly"
                                    (Affichage (e1))
# 1010 "parser.ml"
             in
            _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | AO ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState46
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (n : (
# 11 "parser.mly"
       (string)
# 1042 "parser.ml"
            ))), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 1046 "parser.ml"
            ))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : (
# 45 "parser.mly"
      (instruction)
# 1053 "parser.ml"
            ) = 
# 72 "parser.mly"
                                    (Affectation (n,e1))
# 1057 "parser.ml"
             in
            _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (t : (
# 46 "parser.mly"
      (typ)
# 1078 "parser.ml"
            ))), (n : (
# 11 "parser.mly"
       (string)
# 1082 "parser.ml"
            ))), _, (e1 : (
# 48 "parser.mly"
      (expression)
# 1086 "parser.ml"
            ))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _v : (
# 45 "parser.mly"
      (instruction)
# 1093 "parser.ml"
            ) = 
# 71 "parser.mly"
                                    (Declaration (t,n,e1))
# 1097 "parser.ml"
             in
            _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PV ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | AF ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _menhir_stack = Obj.magic _menhir_stack in
                let (((((_menhir_stack, _menhir_s, (t : (
# 46 "parser.mly"
      (typ)
# 1123 "parser.ml"
                ))), (n : (
# 11 "parser.mly"
       (string)
# 1127 "parser.ml"
                ))), _, (p : (
# 47 "parser.mly"
      ((typ*string) list)
# 1131 "parser.ml"
                ))), _, (li : (
# 44 "parser.mly"
      (instruction list)
# 1135 "parser.ml"
                ))), _, (exp : (
# 48 "parser.mly"
      (expression)
# 1139 "parser.ml"
                ))) = _menhir_stack in
                let _11 = () in
                let _10 = () in
                let _8 = () in
                let _6 = () in
                let _5 = () in
                let _3 = () in
                let _v : (
# 43 "parser.mly"
      (fonction)
# 1150 "parser.ml"
                ) = 
# 62 "parser.mly"
                                                         (Fonction(t,n,p,li,exp))
# 1154 "parser.ml"
                 in
                let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                let _menhir_stack = Obj.magic _menhir_stack in
                assert (not _menhir_env._menhir_error);
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOL ->
                    _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState87
                | ID _v ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState87 _v
                | INT ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState87
                | RAT ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState87
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_reduce2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 49 "parser.mly"
      (expression list)
# 1193 "parser.ml"
    ) = 
# 102 "parser.mly"
                ([])
# 1197 "parser.ml"
     in
    _menhir_goto_cp _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 44 "parser.mly"
      (instruction list)
# 1206 "parser.ml"
    ) = 
# 67 "parser.mly"
                          ([])
# 1210 "parser.ml"
     in
    _menhir_goto_is _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run45 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 1304 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | EQUAL ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | CALL ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CO ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | DENOM ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | ENTIER _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | FALSE ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | ID _v ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | NUM ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PO ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | TRUE ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUAL ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ENTIER _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | PV ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), (n : (
# 11 "parser.mly"
       (string)
# 1375 "parser.ml"
                    ))), (e : (
# 10 "parser.mly"
       (int)
# 1379 "parser.ml"
                    ))) = _menhir_stack in
                    let _5 = () in
                    let _3 = () in
                    let _1 = () in
                    let _v : (
# 45 "parser.mly"
      (instruction)
# 1387 "parser.ml"
                    ) = 
# 73 "parser.mly"
                                    (Constante (n,e))
# 1391 "parser.ml"
                     in
                    _menhir_goto_i _menhir_env _menhir_stack _menhir_s _v
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_reduce4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (
# 47 "parser.mly"
      ((typ*string) list)
# 1429 "parser.ml"
    ) = 
# 79 "parser.mly"
                          ([])
# 1433 "parser.ml"
     in
    _menhir_goto_dp _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 48 "parser.mly"
      (expression)
# 1445 "parser.ml"
    ) = 
# 93 "parser.mly"
                          (True)
# 1449 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 1514 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (n : (
# 11 "parser.mly"
       (string)
# 1522 "parser.ml"
    )) = _v in
    let _v : (
# 48 "parser.mly"
      (expression)
# 1527 "parser.ml"
    ) = 
# 92 "parser.mly"
                          (Ident n)
# 1531 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 48 "parser.mly"
      (expression)
# 1543 "parser.ml"
    ) = 
# 94 "parser.mly"
                          (False)
# 1547 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "parser.mly"
       (int)
# 1554 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (e : (
# 10 "parser.mly"
       (int)
# 1562 "parser.ml"
    )) = _v in
    let _v : (
# 48 "parser.mly"
      (expression)
# 1567 "parser.ml"
    ) = 
# 95 "parser.mly"
                          (Entier e)
# 1571 "parser.ml"
     in
    _menhir_goto_e _menhir_env _menhir_stack _menhir_s _v

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | CALL ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | CO ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | DENOM ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ENTIER _v ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | FALSE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ID _v ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | NUM ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | PO ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | TRUE ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | PO ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | CALL ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | CO ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | DENOM ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | ENTIER _v ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
            | FALSE ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | ID _v ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
            | NUM ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | PO ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | TRUE ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | PF ->
                _menhir_reduce2 _menhir_env (Obj.magic _menhir_stack) MenhirState16
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | CONST ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | ID _v ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
    | IF ->
        _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | INT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | PRINT ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | RAT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | WHILE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | AF ->
        _menhir_reduce25 _menhir_env (Obj.magic _menhir_stack) MenhirState4
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4

and _menhir_goto_typ : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 46 "parser.mly"
      (typ)
# 1719 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState78 | MenhirState67 | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | EQUAL ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | CALL ->
                    _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | CO ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | DENOM ->
                    _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | ENTIER _v ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
                | FALSE ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | ID _v ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
                | NUM ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | PO ->
                    _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | TRUE ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState87 | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | PO ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOL ->
                    _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState72
                | INT ->
                    _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState72
                | RAT ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72
                | PF ->
                    _menhir_reduce4 _menhir_env (Obj.magic _menhir_stack) MenhirState72
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState74 | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOL ->
                _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | INT ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | RAT ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | PF ->
                _menhir_reduce4 _menhir_env (Obj.magic _menhir_stack) MenhirState74
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState3 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 46 "parser.mly"
      (typ)
# 1969 "parser.ml"
    ) = 
# 85 "parser.mly"
          (Rat)
# 1973 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 46 "parser.mly"
      (typ)
# 1985 "parser.ml"
    ) = 
# 84 "parser.mly"
          (Int)
# 1989 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "parser.mly"
       (string)
# 1996 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | AO ->
        _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3

and _menhir_run59 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (
# 46 "parser.mly"
      (typ)
# 2018 "parser.ml"
    ) = 
# 83 "parser.mly"
          (Bool)
# 2022 "parser.ml"
     in
    _menhir_goto_typ _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 52 "parser.mly"
       (Ast.AstSyntax.programme)
# 2041 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOL ->
        _menhir_run59 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INT ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | RAT ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 269 "<standard.mly>"
  

# 2071 "parser.ml"
