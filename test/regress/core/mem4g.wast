(module
  (memory 65536 65536)
  (func (export "load") (param i32) (result i32)
    (i32.load offset=0 (local.get 0))
  )
  (func (export "store") (param i32 i32) (result i32)
    (i32.store offset=0 (local.get 0) (local.get 1))
    (i32.load offset=0 (local.get 0))
  )
)
(assert_return (invoke "load" (i32.const 0)) (i32.const 0))
(assert_return (invoke "load" (i32.const 1)) (i32.const 0))
(assert_return (invoke "load" (i32.const 1024)) (i32.const 0))
(assert_return (invoke "load" (i32.const 65532)) (i32.const 0))
(assert_return (invoke "load" (i32.const 16777216)) (i32.const 0))
(assert_return (invoke "load" (i32.const 4294967292)) (i32.const 0))

(assert_return (invoke "store" (i32.const 0) (i32.const 0x01020304)) (i32.const 0x01020304))
(assert_return (invoke "store" (i32.const 1) (i32.const 0x11121314)) (i32.const 0x11121314))
(assert_return (invoke "store" (i32.const 1024) (i32.const 0x21222324)) (i32.const 0x21222324))
(assert_return (invoke "store" (i32.const 65532) (i32.const 0x31323334)) (i32.const 0x31323334))
(assert_return (invoke "store" (i32.const 16777216) (i32.const 0x41424344)) (i32.const 0x41424344))
(assert_return (invoke "store" (i32.const 4294967292) (i32.const 0x51525354)) (i32.const 0x51525354))

(assert_return (invoke "load" (i32.const 0)) (i32.const 0x12131404))
(assert_return (invoke "load" (i32.const 1)) (i32.const 0x11121314))
(assert_return (invoke "load" (i32.const 1024)) (i32.const 0x21222324))
(assert_return (invoke "load" (i32.const 65532)) (i32.const 0x31323334))
(assert_return (invoke "load" (i32.const 16777216)) (i32.const 0x41424344))
(assert_return (invoke "load" (i32.const 4294967292)) (i32.const 0x51525354))
