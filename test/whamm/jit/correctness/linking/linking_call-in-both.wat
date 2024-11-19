;; TO RUN:
;; wasm-tools parse ./test/whamm/jit/correctness/linking/linking_call-in-both.wat -o ./test/whamm/jit/correctness/linking/linking_call-in-both.wasm
;; wasm-tools parse ./test/whamm/jit/correctness/linking/instr.wat -o ./test/whamm/jit/correctness/linking/instr.wasm
;; wizard --expose=wizeng --monitors=./test/whamm/jit/correctness/linking/linking_call-in-both.wasm ./test/whamm/jit/correctness/linking/instr.wasm ./test/monitors/whamm/locals_to_call.wasm

;; EXPECTED OUTPUT:
;; hello pred!
;; hello call!

;; ACTUAL OUTPUT:
;; ./test/whamm/jit/correctness/linking/linking_call-in-both.wasm:0x0: import #0("instr"."print_pred"): function import not found
;; ./test/whamm/jit/correctness/linking/linking_call-in-both.wasm:0x0: import #0("instr"."print_pred"): function import not found
;; ./test/whamm/jit/correctness/linking/linking_call-in-both.wasm:0x0: import #0("instr"."print_pred"): function import not found
;; Exception in thread "main" java.lang.NullPointerException: Cannot read field "module" because "V3C_WhammMonitor.getWhammInstance(V3C_Module).f0" is null
;; 	at V3C_WhammMonitor.onFinish(Unknown Source)
;; 	at V3K_wizeng$Dmain.main(Unknown Source)
;; 	at V3K_wizeng$Dmain.main(Unknown Source)

;; SUMMARY
;; - num_match_rules: 1
;; - overlapping? false
;; - predicated?
;;   - static: true
;;   - dynamic: false
;; - requested_data:
;;   - predicate: argN, immN, localN
;;   - body: argN, immN, localN
;; - $alloc function? false
;; - END? false
;; - multi-memory? false
;; - linking? true
(module
    (import "instr" "print_pred" (func $print_pred))
    (import "instr" "print_call" (func $print_call))

    (func $call_pred (param $fid i32) (param $pc i32) (param $local1 i32) (param $arg0 i32) (param $imm0 i32) (result i32)
        (call $print_pred)
        (block $error
            (br_if $error (i32.ne (i32.const 0) (local.get $fid)))
            (br_if $error (i32.ne (i32.const 15) (local.get $pc)))
            (br_if $error (i32.ne (i32.const 2) (local.get $local1)))
            (br_if $error (i32.ne (i32.const 1) (local.get $arg0)))
            (br_if $error (i32.ne (i32.const 1) (local.get $imm0)))
            (i32.and
                (i32.eq (i32.const 0) (local.get $fid))
                (i32.eq (i32.const 15) (local.get $pc))
            )
            return
        )
        unreachable
    )
    ;; out of order to test that the order is not assumed for these!
    (func $call_probe (export "wasm:opcode:call / $call_pred(fid, pc, local1, arg0, imm0) / (imm0, arg1, local1)")
            (param $imm0 i32) (param $arg1 i32) (param $local1 i32)
        (call $print_call)
        (block $error
            (br_if $error (i32.ne (i32.const 1) (local.get $imm0)))
            (br_if $error (i32.ne (i32.const 2) (local.get $arg1)))
            (br_if $error (i32.ne (i32.const 2) (local.get $local1)))
            return
        )
        unreachable
    )
)