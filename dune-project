(lang dune 1.11)
(name fp-syntax)
(version 0.0.0)

(generate_opam_files true)

(source (github facelesspanda/fp-syntax))
(license MIT)
(authors "Clément Busschaert")
(maintainers "clement.busschaert@gmail.com")

(package
 (name fp-syntax)
 (synopsis "Various operators for OCaml 4.08 and later")
 (description "Various operators for OCaml 4.08 and later")
 (depends dune))

(package
 (name fp-syntax_lwt)
 (synopsis "Lwt operators for OCaml 4.08 and later")
 (description "Lwt operators for OCaml 4.08 and later")
 (depends dune lwt))

(package
 (name fp-syntax_react)
 (synopsis "React operators for OCaml 4.08 and later")
 (description "React operators for OCaml 4.08 and later")
 (depends dune react))