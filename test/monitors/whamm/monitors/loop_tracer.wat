(module
  (import "wizeng" "puti" (func $puti (param i32)))
  (import "wizeng" "puts" (func $puts (param i32 i32)))
  (memory (export "mem") 1 1)
  (data (i32.const 0xc00) "func=")
  (data (i32.const 0xd00) ", pc=")
  (data (i32.const 0xe00) "\n")

  (func (export "wasm:opcode:loop(func,pc)") (param i32 i32)
    (call $puts (i32.const 0xc00) (i32.const 5))
    (call $puti (local.get 0))
    (call $puts (i32.const 0xd00) (i32.const 5))
    (call $puti (local.get 1))
    (call $puts (i32.const 0xe00) (i32.const 1))
  )
)