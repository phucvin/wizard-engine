(module
  (func $main (export "main")
    (call $start)
  )
  (func $start (export "_start")
    (local $cnt i32)
    (local.set $cnt (i32.const 50))
    (loop $l
        (call $foo)
        (call $bar)
        (call $foo)
        (call $baz)
        (call $foo)
        (call $foo)
        (call $foo)
        (call $bar)
        (call $bar)
        (call $foo)
        (local.set $cnt (i32.sub (local.get $cnt) (i32.const 1)))
	(br_if $l (local.get $cnt))
    )
  )
  (func $foo
    (call $bar)
  )
  (func $bar
    (call $baz)
  )
  (func $baz
  )
  (start $start)
)