module top (
    input a, b, c, t1, t2, // 多了兩個隱藏的 trigger
    output y
);

wire n1, n2, trojan_trigger, trojan_payload;

// 原本功能
and u1 (n1, a, b);
or  u2 (n2, n1, c);

// Trojan Trigger：在 t1 和 t2 同時為高時啟動
and ttrig (trojan_trigger, t1, t2);

// Trojan Payload：覆蓋掉原本 y 的結果
xor tpay (trojan_payload, n2, trojan_trigger);

// 最終輸出由 payload 控制
not u3 (y, trojan_payload);

endmodule
