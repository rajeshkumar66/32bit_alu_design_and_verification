
typedef enum logic [2:0] {
    ADD, SUB, MUL, DIV, SL, SR
} op_code;

typedef enum logic [0:0] {
    SIGNED, UNSIGNED
} operand_type;

typedef union packed {
    logic [31:0] unsigned_value;
    logic signed [31:0] signed_value;
} Data_union;

typedef struct packed {
    op_code opc;
    operand_type op_type;
    Data_union data_a;
    Data_union data_b;
} Instruction_struct;
// ALU Module
module alu (
    input Instruction_struct iw,
    output logic [31:0] alu_out
);
always @(iw) begin
        if(iw.op_type) begin
                case (iw.opc)
                    ADD: alu_out = iw.data_a.signed_value + iw.data_b.signed_value;
                    SUB: alu_out = iw.data_a.signed_value - iw.data_b.signed_value;
                    MUL: alu_out = iw.data_a.signed_value * iw.data_b.signed_value;
                    DIV: alu_out = iw.data_a.signed_value / iw.data_b.signed_value;
                    SL: alu_out = iw.data_a.signed_value << 2;
                    SR: alu_out = iw.data_a.signed_value >> 2;
                    default: alu_out = 'x;
                endcase
            end
        else begin
                case (iw.opc)
                    ADD: alu_out = iw.data_a.unsigned_value + iw.data_b.unsigned_value;
                    SUB: alu_out = iw.data_a.unsigned_value - iw.data_b.unsigned_value;
                    MUL: alu_out = iw.data_a.unsigned_value * iw.data_b.unsigned_value;
                    DIV: alu_out = iw.data_a.unsigned_value / iw.data_b.unsigned_value;
                    SL: alu_out = iw.data_a.unsigned_value << 2;
                    SR: alu_out = iw.data_a.unsigned_value >> 2;
                    default: alu_out = 'x;
                endcase
            end
    end
endmodule
