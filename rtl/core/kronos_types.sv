// Copyright (c) 2020 Sonal Pinto
// SPDX-License-Identifier: Apache-2.0

package kronos_types;

// ============================================================
// Types
typedef logic [31:0] instr_t;

typedef struct packed {
    logic [31:0] pc;
    logic [31:0] ir;
} pipeIFID_t;

typedef struct packed {
    logic [31:0] pc;
    logic [31:0] op1;
    logic [31:0] op2;
    logic [31:0] op3;
    logic [31:0] op4;
    // ------------------------
    // EX controls
    logic        cin;
    logic        rev;
    logic        uns;
    logic        eq;
    logic        inv;
    logic        align;
    logic [2:0]  sel;
    // ------------------------
    // WB controls
    logic [4:0]  rd;
    logic        rd_write;
    logic        branch;
    logic        branch_cond;
    logic        ld;
    logic        st;
    logic [2:0]  funct3;
    // ------------------------
    // System
    logic        system;
    logic        ecall;
    // ------------------------
    // Exceptions
    logic        is_illegal;
} pipeIDEX_t;

typedef struct packed {
    logic [31:0] pc;
    logic [31:0] result1;
    logic [31:0] result2;
    // ------------------------
    // WB controls
    logic [4:0]  rd;
    logic        rd_write;
    logic        branch;
    logic        branch_cond;
    logic        ld;
    logic        st;
    logic [2:0]  funct3;
    // ------------------------
    // System
    logic        system;
    logic        ecall;
    // ------------------------
    // Exceptions
    logic        is_illegal;
} pipeEXWB_t;


// ============================================================
// Instruction Types: {opcode[6:2]}
parameter logic [4:0] INSTR_LOAD  = 5'b00_000;
parameter logic [4:0] INSTR_STORE = 5'b01_000;
parameter logic [4:0] INSTR_BR    = 5'b11_000;

parameter logic [4:0] INSTR_JALR  = 5'b11_001;

parameter logic [4:0] INSTR_MISC  = 5'b00_011;
parameter logic [4:0] INSTR_JAL   = 5'b11_011;

parameter logic [4:0] INSTR_OPIMM = 5'b00_100;
parameter logic [4:0] INSTR_OP    = 5'b01_100;
parameter logic [4:0] INSTR_SYS   = 5'b11_100;

parameter logic [4:0] INSTR_AUIPC = 5'b00_101;
parameter logic [4:0] INSTR_LUI   = 5'b01_101;

// ============================================================
// ALU Result Select
parameter logic [2:0] ALU_ADDER = 3'd0;
parameter logic [2:0] ALU_AND   = 3'd1;
parameter logic [2:0] ALU_OR    = 3'd2;
parameter logic [2:0] ALU_XOR   = 3'd3;
parameter logic [2:0] ALU_COMP  = 3'd4;
parameter logic [2:0] ALU_SHIFT = 3'd5;

// ============================================================
// Memory Acess Size
parameter logic [1:0] BYTE      = 2'b00;
parameter logic [1:0] HALF      = 2'b01;
parameter logic [1:0] WORD      = 2'b10;

// ============================================================
// Constants
parameter logic [31:0] ZERO   = 32'h0;
parameter logic [31:0] FOUR   = 32'h4;

// ============================================================
// Interrupts
parameter logic [3:0] SOFTWARE_INTERRUPT    = 4'd3;
parameter logic [3:0] TIMER_INTERRUPT       = 4'd7;
parameter logic [3:0] EXTERNAL_INTERRUPT    = 4'd11;

// ============================================================
// Exceptions
parameter logic [3:0] INSTR_ADDR_MISALIGNED = 4'd0;
parameter logic [3:0] ILLEGAL_INSTR         = 4'd2;
parameter logic [3:0] ECALL_MACHINE         = 4'd11;

// ============================================================
// Control Status Register

// CSR operations
parameter logic [1:0]  CSR_RW       = 2'b01;
parameter logic [1:0]  CSR_RS       = 2'b10;
parameter logic [1:0]  CSR_RC       = 2'b11;

// CSR Address
parameter logic [11:0] MSTATUS      = 12'h300;
parameter logic [11:0] MIE          = 12'h304;
parameter logic [11:0] MTVEC        = 12'h305;

parameter logic [11:0] MSCRATCH     = 12'h340;
parameter logic [11:0] MEPC         = 12'h341;
parameter logic [11:0] MCAUSE       = 12'h342;
parameter logic [11:0] MTVAL        = 12'h343;
parameter logic [11:0] MIP          = 12'h344;

parameter logic [11:0] MCYCLE       = 12'hB00;
parameter logic [11:0] MINSTRET     = 12'hB02;
parameter logic [11:0] MCYCLEH      = 12'hB80;
parameter logic [11:0] MINSTRETH    = 12'hB82;

// Privilege levels
parameter logic [1:0] PRIVILEGE_MACHINE = 2'b11;
// mtvec modes
parameter logic [1:0] DIRECT_MODE   = 2'b00;
 
endpackage
