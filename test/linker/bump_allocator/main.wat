(
module
(import "alloc" "allocate" (func $__15411_allocate (param i32) (result i32)))
(import "alloc" "memory" (memory 1))
(import "func" "func" (func $func (param i32) (param i32) (result i32)))
(import "wizeng" "puti" (func $puti (param i32)))

(func $15411abort (i32.const 1) (i32.const 0) (i32.div_u) (drop))
(func $15411memerror (i32.const -1) (i32.load) (drop))

(func $main (result i32)
(local $__15411TEMP1__ i32)
(local $i i32)
(local $a i32)
(local $b i32)
(local $__15411TEMP2__ i32)
(i32.const 4)
(call $__15411_allocate)
(local.set $a)
(i32.const 10)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP1__)
(i32.const 0)
(i32.lt_s)
(if (then
(call $15411memerror)
)
)

(i32.const 4)
(i32.mul)
(local.tee $__15411TEMP1__)
(i32.const 4)
(i32.add)
(call $__15411_allocate)
(local.tee $__15411TEMP2__)
(local.get $__15411TEMP1__)
(i32.store)
(local.get $__15411TEMP2__)
(i32.const 4)
(i32.add)
(local.set $b)
(local.get $a)
(i32.const 10)
(local.set $__15411TEMP2__)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP1__)
(i32.const 0)
(i32.eq)
(if (then
(call $15411memerror)
)
)

(local.get $__15411TEMP2__)
(i32.store)
(i32.const 0)
(local.set $i)
(block $0
(local.get $i)
(i32.const 10)
(i32.lt_s)
(i32.eqz)
(br_if $0)
(loop $0
(local.get $b)
(local.get $i)
(local.set $__15411TEMP2__)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP1__)
(i32.const 0)
(i32.eq)
(if (then
(call $15411memerror)
)
)

(local.get $__15411TEMP2__)
(i32.const 4)
(i32.mul)
(local.set $__15411TEMP2__)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP2__)
(local.get $__15411TEMP1__)
(i32.const 4)
(i32.sub)
(i32.load)
(local.get $__15411TEMP2__)
(i32.le_s)
(if (then
(call $15411memerror)
)
)

(local.get $__15411TEMP2__)
(i32.const 0)
(i32.lt_s)
(if (then
(call $15411memerror)
)
)

(i32.add)
(local.get $i)
(i32.const 2)
(i32.rem_s)
(i32.const 0)
(i32.eq)
(if (result i32)
(then
(local.get $i)
(i32.const 10)
(i32.add)
)
(else
(local.get $i)
(i32.const 10)
(i32.sub)
)
)

(local.set $__15411TEMP2__)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP1__)
(i32.const 0)
(i32.eq)
(if (then
(call $15411memerror)
)
)

(local.get $__15411TEMP2__)
(i32.store)
(local.get $i)
(i32.const 1)
(i32.add)
(local.set $i)
(local.get $i)
(i32.const 10)
(i32.lt_s)
(br_if $0)
)
)

(local.get $a)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP1__)
(i32.const 0)
(i32.eq)
(if (then
(call $15411memerror)
)
)

(i32.load)
(local.get $b)
(i32.const 3)
(local.set $__15411TEMP2__)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP1__)
(i32.const 0)
(i32.eq)
(if (then
(call $15411memerror)
)
)

(local.get $__15411TEMP2__)
(i32.const 4)
(i32.mul)
(local.set $__15411TEMP2__)
(local.tee $__15411TEMP1__)
(local.get $__15411TEMP2__)
(local.get $__15411TEMP1__)
(i32.const 4)
(i32.sub)
(i32.load)
(local.get $__15411TEMP2__)
(i32.le_s)
(if (then
(call $15411memerror)
)
)

(local.get $__15411TEMP2__)
(i32.const 0)
(i32.lt_s)
(if (then
(call $15411memerror)
)
)

(i32.add)
(i32.load)
(call $func)
(return)
(unreachable)
)

(func $out
call $main
call $puti
)
(export "main" (func $out))

)