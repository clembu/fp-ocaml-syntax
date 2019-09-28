(** These are useful operators when using Lwt with OCaml 4.08.0 and later.

    They make the choice of using the character [%] to note their [Lwt.t]
    nature.*)

(** {1:infix Infix Operators}

    These use the character [%] to help differenciate from other infix monadic
    operators.

    The "not recommended" operators ([Lwt.(<&>)] and [Lwt.(<?>)]) are not
    included.

    @see <https://ocsigen.org/lwt/latest/api/Lwt.Infix>
    The official Lwt documentation for operators *)

val ( >>% ) : 'a Lwt.t -> ('a -> 'b Lwt.t) -> 'b Lwt.t
(** The same as [Lwt.(>>=)]. Equivalent to [Lwt.bind].

    Usage example:

    {[
      let () =
        Lwt_main.run
          (Lwt_io.(read_line stdin) >>% Lwt_io.printl)
    ]}

    It is recommended to use {!val:let>%} instead.

    @see <https://ocsigen.org/lwt/latest/api/Lwt#VALbind>
    The official Lwt documentation for [Lwt.bind] *)

val ( >|% ) : 'a Lwt.t -> ('a -> 'b) -> 'b Lwt.t
(** The same as [Lwt.(>|=)]. Equivalent to [Lwt.map].

    Usage example:

    {[
      let () =
        Lwt_main.run
          (Lwt_io.(read_line stdin) >|% ignore)
    ]}

    It is recommended to use {!val:let|%} instead.

    @see <https://ocsigen.org/lwt/latest/api/Lwt#VALmap>
    The official Lwt documentation for [Lwt.map] *)

val ( <*%> ) : 'a Lwt.t -> 'b Lwt.t -> ('a * 'b) Lwt.t
(** Equivalent to [Lwt.both]. *)

(** {1:bindings Binding operators}

    These use the character [%] to help differenciate from other monadic
    binding operators. *)

val ( let>% ) : 'a Lwt.t -> ('a -> 'b Lwt.t) -> 'b Lwt.t
(** The same as the PPX [let%lwt] from [Ppx_lwt]. Equivalent to {!val:(>>%)}
    and [Lwt.bind].

    Usage example:

    {[
      let () =
        let read_line_and_print_it =
          let>% line = Lwt_io.read_line stdin in
          Lwt_io.printl line
        in
        Lwt_main.run read_line_and_print_it
    ]}
    @see <https://ocsigen.org/lwt/latest/api/Ppx_lwt#2_Ppxextensions>
    The official Lwt documentation for [let%lwt] *)

val ( let|% ) : 'a Lwt.t -> ('a -> 'b) -> 'b Lwt.t
(** Has no equivalent in [Ppx_lwt]. Equivalent to {!val:(>|%)} and [Lwt.map].

    Usage example:

    {[
      let () =
        let read_line_and_print_its_length =
          let>% line_length =
            let|% line = Lwt_io.read_line stdin in
            String.length line (* directly map to an int. No Lwt.t *)
          in
          Lwt_io.printl line_length
        in
        Lwt_main.run read_line_and_print_its_length
    ]} *)

val ( and*% ) : 'a Lwt.t -> 'b Lwt.t -> ('a * 'b) Lwt.t
(** Same as using [and] with [let%lwt] from [Ppx_lwt]. Equivalent to
    [Lwt.both].

    Usage example:

    {[
      let () =
        (* This reads a line from stdin, and prints it to stdout
         * but only if five seconds have passed since the beginning
         * of the program. *)
        let p =
          let>% line = Lwt_io.read_line stdin
          and>% () = Lwt_unix.sleep 5. in
          Lwt_io.printl line
        in
        Lwt_main.run p
    ]}
    @see <https://ocsigen.org/lwt/latest/api/Lwt#VALboth>
    The official Lwt documentation for [Lwt.both] *)
