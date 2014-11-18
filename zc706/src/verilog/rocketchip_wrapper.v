`timescale 1 ps / 1 ps
`include "clocking.vh"

module rocketchip_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,

    sfp_txp,
    sfp_txn,
    sfp_rxp,
    sfp_rxn,
    sfp_tx_disable,
    sfp_125_clk_p,
    sfp_125_clk_n,
    sfp_link_status,
    clk125_heartbeat,
    clk_200_p,
    clk_200_n);

  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;

  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;

  output sfp_txp;
  output sfp_txn;
  input sfp_rxp;
  input sfp_rxn;
  output sfp_tx_disable;
  input sfp_125_clk_p;
  input sfp_125_clk_n;
  output sfp_link_status;
  output clk125_heartbeat;
  input clk_200_p;
  input clk_200_n;

  wire FCLK_RESET0_N;


wire [7:0] rx_axis_fifo_tdata;
wire rx_axis_fifo_tvalid;
wire rx_axis_fifo_tready;
wire rx_axis_fifo_tlast;


wire [7:0] tx_axis_fifo_tdata;
wire tx_axis_fifo_tvalid;
wire tx_axis_fifo_tready;
wire tx_axis_fifo_tlast;

wire [11:0] s_axi_awaddr;
wire s_axi_awvalid;
wire s_axi_awready;

wire [31:0] s_axi_wdata;
wire s_axi_wvalid;
wire s_axi_wready;

wire [1:0] s_axi_bresp;
wire s_axi_bvalid;
wire s_axi_bready;

wire [11:0] s_axi_araddr;
wire s_axi_arvalid;
wire s_axi_arready;

wire [31:0] s_axi_data;
wire [1:0] s_axi_rresp;
wire s_axi_rvalid;
wire s_axi_rready;








  wire [31:0]M_AXI_araddr;
  wire [1:0]M_AXI_arburst;
  wire [7:0]M_AXI_arlen;
  wire M_AXI_arready;
  wire [2:0]M_AXI_arsize;
  wire M_AXI_arvalid;
  wire [31:0]M_AXI_awaddr;
  wire [1:0]M_AXI_awburst;
  wire [7:0]M_AXI_awlen;
  wire [3:0]M_AXI_wstrb;
  wire M_AXI_awready;
  wire [2:0]M_AXI_awsize;
  wire M_AXI_awvalid;
  wire M_AXI_bready;
  wire M_AXI_bvalid;
  wire [31:0]M_AXI_rdata;
  wire M_AXI_rlast;
  wire M_AXI_rready;
  wire M_AXI_rvalid;
  wire [31:0]M_AXI_wdata;
  wire M_AXI_wlast;
  wire M_AXI_wready;
  wire M_AXI_wvalid;
  wire [11:0] M_AXI_arid, M_AXI_awid; // outputs from ARM core
  wire [11:0] M_AXI_bid, M_AXI_rid;   // inputs to ARM core

  wire [4:0] raddr, waddr;
  reg  [4:0] raddr_r, waddr_r;
  reg [11:0] arid_r, awid_r;
  reg [15:0] host_out_bits_r;

  wire host_in_fifo_full, host_in_fifo_empty, host_in_fifo_rden, host_in_fifo_wren;
  wire host_out_fifo_full, host_out_fifo_empty, host_out_fifo_wren, host_out_fifo_rden;
  wire [31:0] host_in_fifo_dout, host_out_fifo_dout;
  wire [5:0] host_out_fifo_count;
  reg host_out_count, host_in_count;

  wire [31:0]S_AXI_addr;
  wire S_AXI_arready;
  wire S_AXI_arvalid;
  wire S_AXI_awready;
  wire S_AXI_awvalid;
  wire S_AXI_bready;
  wire S_AXI_bvalid;
  wire [1:0]S_AXI_bresp;
  wire [63:0]S_AXI_rdata;
  wire S_AXI_rlast;
  reg  S_AXI_rlast_r;
  wire S_AXI_rready;
  wire S_AXI_rvalid;
  wire [63:0]S_AXI_wdata;
  wire S_AXI_wlast;
  wire S_AXI_wready;
  wire S_AXI_wvalid;
  wire [5:0] S_AXI_arid, S_AXI_awid; // inputs to ARM core
  wire [5:0] S_AXI_bid, S_AXI_rid;   // outputs from ARM core

  wire mem_req_cmd_val, mem_req_cmd_rdy, mem_req_cmd_rw, mem_req_data_val, mem_req_data_rdy;
  wire mem_resp_val,mem_resp_rdy;
  wire [4:0] mem_req_tag, mem_resp_tag;
  wire [25:0] mem_req_addr;
  wire [127:0] mem_req_data_bits;
  reg [63:0] mem_resp_data_buf;

  wire reset, reset_cpu;

  wire host_in_valid, host_in_ready, host_out_ready, host_out_valid;
  wire [15:0] host_in_bits, host_out_bits;
  wire host_clk;
  wire gclk_fbout, host_clk_i, mmcm_locked;

  wire sfp_txp;
  wire sfp_txn;
  wire sfp_rxp;
  wire sfp_rxn;
  wire sfp_tx_disable;
  wire sfp_125_clk_p;
  wire sfp_125_clk_n;
  wire sfp_link_status;
  wire clk125_heartbeat;
  wire clk_200_p;
  wire clk_200_n;

 
  wire userclk2;
   wire gtrefclk; 

    wire REF_CLK;
    wire GTX_CLK;
    wire PHY_RST_N;
    wire MII_TX_CLK;
    wire [7:0] GMII_TXD;
    wire GMII_TX_EN;
    wire GMII_TX_ER;
    wire GMII_TX_CLK;
    wire [7:0] GMII_RXD;
    wire GMII_RX_DV;
    wire GMII_RX_ER;
    wire GMII_COL;
    wire GMII_CRS;
    wire MDC;
    wire MDIO_I;
    wire MDIO_O;

    reg [7:0] GMII_TXD_reg;
    reg GMII_TX_EN_reg;
    reg GMII_TX_ER_reg;
    reg [7:0] GMII_RXD_reg;
    reg GMII_RX_DV_reg;
    reg GMII_RX_ER_reg;
    reg [15:0] status_vector = 16'd0;

    wire [15:0] status_vector_int;

    wire FCLK_CLK0;
    wire FCLK_RESET0_N;

    wire userclk;

    wire clk_200;
    wire clk_200_bufg;
    
    assign sfp_tx_disable = 1'b0;
    assign sfp_link_status = status_vector[0];
    
    IBUFDS diff_clk_200 (
        .I (clk_200_p),
        .IB (clk_200_n),
        .O (clk_200)
    );

    BUFG clk200_bufg (
        .I (clk_200),
        .O (clk_200_bufg)
    );

    reg [23:0] clk125_counter = 24'd0;

    always @(posedge userclk2)
        clk125_counter <= clk125_counter + 1'b1;

    assign clk125_heartbeat = clk125_counter[23];

    assign GTX_CLK_in = userclk2;
    assign REF_CLK_in = userclk2;







  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FCLK_CLK0(FCLK_CLK0),
        .FCLK_RESET0_N(FCLK_RESET0_N),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        // master AXI interface (zynq = master, fpga = slave)
        .M_AXI_araddr(M_AXI_araddr),
        .M_AXI_arburst(M_AXI_arburst), // burst type
        .M_AXI_arcache(),
        .M_AXI_arid(M_AXI_arid),
        .M_AXI_arlen(M_AXI_arlen), // burst length (#transfers)
        .M_AXI_arlock(),
        .M_AXI_arprot(),
        .M_AXI_arqos(),
        .M_AXI_arready(M_AXI_arready),
        .M_AXI_arregion(),
        .M_AXI_arsize(M_AXI_arsize), // burst size (bits/transfer)
        .M_AXI_arvalid(M_AXI_arvalid),
        //
        .M_AXI_awaddr(M_AXI_awaddr),
        .M_AXI_awburst(M_AXI_awburst),
        .M_AXI_awcache(),
        .M_AXI_awid(M_AXI_awid),
        .M_AXI_awlen(M_AXI_awlen),
        .M_AXI_awlock(),
        .M_AXI_awprot(),
        .M_AXI_awqos(),
        .M_AXI_awready(M_AXI_awready),
        .M_AXI_awregion(),
        .M_AXI_awsize(M_AXI_awsize),
        .M_AXI_awvalid(M_AXI_awvalid),
        //
        .M_AXI_bid(M_AXI_bid),
        .M_AXI_bready(M_AXI_bready),
        .M_AXI_bresp(2'b00),
        .M_AXI_bvalid(M_AXI_bvalid),
        //
        .M_AXI_rdata(M_AXI_rdata),
        .M_AXI_rid(M_AXI_rid),
        .M_AXI_rlast(M_AXI_rlast),
        .M_AXI_rready(M_AXI_rready),
        .M_AXI_rresp(),
        .M_AXI_rvalid(M_AXI_rvalid),
        //
        .M_AXI_wdata(M_AXI_wdata),
        .M_AXI_wlast(M_AXI_wlast),
        .M_AXI_wready(M_AXI_wready),
        .M_AXI_wstrb(M_AXI_wstrb),
        .M_AXI_wvalid(M_AXI_wvalid),
        // slave AXI interface (fpga = master, zynq = slave) 
        // connected directly to DDR controller to handle test chip mem
        .S_AXI_araddr(S_AXI_addr),
        .S_AXI_arburst(2'b01),  // type INCR
        .S_AXI_arcache(4'b0011),
        .S_AXI_arid(S_AXI_arid),
        .S_AXI_arlen(8'd7), // burst length = 8 transfers
        .S_AXI_arlock(1'b0),
        .S_AXI_arprot(3'b000),
        .S_AXI_arqos(4'b0000),
        .S_AXI_arready(S_AXI_arready),
        .S_AXI_arregion(4'b0000),
        .S_AXI_arsize(3'b011), // burst size = 64 bits/beat
        .S_AXI_arvalid(S_AXI_arvalid),
        //
        .S_AXI_awaddr(S_AXI_addr),
        .S_AXI_awburst(2'b01),
        .S_AXI_awcache(4'b0011),
        .S_AXI_awid(S_AXI_awid),
        .S_AXI_awlen(8'd7), // burst length = 8 transfers
        .S_AXI_awlock(1'b0),
        .S_AXI_awprot(3'b000),
        .S_AXI_awqos(4'b0000),
        .S_AXI_awready(S_AXI_awready),
        .S_AXI_awregion(4'b0000),
        .S_AXI_awsize(3'b011),
        .S_AXI_awvalid(S_AXI_awvalid),
        //
        .S_AXI_bid(S_AXI_bid),
        .S_AXI_bready(S_AXI_bready),
        .S_AXI_bresp(),
        .S_AXI_bvalid(S_AXI_bvalid),
        //
        .S_AXI_rid(S_AXI_rid),
        .S_AXI_rdata(S_AXI_rdata),
        .S_AXI_rlast(S_AXI_rlast),
        .S_AXI_rready(S_AXI_rready),
        .S_AXI_rresp(),
        .S_AXI_rvalid(S_AXI_rvalid),
        //
        .S_AXI_wdata(S_AXI_wdata),
        .S_AXI_wlast(S_AXI_wlast),
        .S_AXI_wready(S_AXI_wready),
        .S_AXI_wstrb(8'hff),
        .S_AXI_wvalid(S_AXI_wvalid),
        .ext_clk_in(host_clk)

        );

`define DCOUNT_ADDR 5'h00
`define RFIFO_ADDR  5'h01

`define WFIFO_ADDR 5'h00
`define RESET_ADDR 5'h1f

  // HTIF interface between ARM and reference chip on FPGA via memory mapped registers
  // 2 read addresses : 1 for FIFO data count (0x0), 1 for FIFO data (0x1)
  // 2 write addresses: 1 for FIFO data (0x0), 1 for reset (0x31)
  
  // host_in (from ARM to fpga)

  assign waddr = M_AXI_awaddr[6:2];
  assign raddr = M_AXI_araddr[6:2];

  fifo_32x32 host_in_fifo (
    .clk(host_clk),
    .reset(reset),
    .din(M_AXI_wdata),
    .wren(host_in_fifo_wren),
    .rden(host_in_fifo_rden),
    .dout(host_in_fifo_dout),
    .full(host_in_fifo_full),
    .empty(host_in_fifo_empty),
    .count()
  );

  assign host_in_valid = !host_in_fifo_empty;
  assign host_in_fifo_rden = host_in_count && host_in_valid && host_in_ready;
  assign host_in_bits = !host_in_count ? host_in_fifo_dout[15:0] : host_in_fifo_dout[31:16];

  // host_out (from FPGA to ARM)
  
  assign host_out_ready = !host_out_fifo_full;
  assign host_out_fifo_wren = (host_out_count == 1'b1);
  assign host_out_fifo_rden = M_AXI_rvalid && M_AXI_rready && (raddr_r == `RFIFO_ADDR);

  fifo_32x32 host_out_fifo (
    .clk(host_clk),
    .reset(reset),
    .din({host_out_bits, host_out_bits_r}),
    .wren(host_out_fifo_wren),
    .rden(host_out_fifo_rden),
    .dout(host_out_fifo_dout),
    .full(host_out_fifo_full),
    .empty(host_out_fifo_empty),
    .count(host_out_fifo_count)
  );

  assign reset = !FCLK_RESET0_N || !mmcm_locked;

  parameter st_rd_idle = 1'b0;
  parameter st_rd_read = 1'b1;

  reg st_rd = st_rd_idle;

  parameter st_wr_idle  = 2'd0;
  parameter st_wr_write = 2'd1;
  parameter st_wr_ack   = 2'd2;

  reg [1:0] st_wr = st_wr_idle;

  always @(posedge host_clk)
  begin

    if (reset)
    begin
      host_out_bits_r <= 16'd0;
      host_out_count <= 1'd0;
      host_in_count <= 1'd0;
      raddr_r <= 5'd0;
      waddr_r <= 5'd0;
      arid_r <= 12'd0;
      awid_r <= 12'd0;
      st_rd <= st_rd_idle;
      st_wr <= st_wr_idle;
    end
    else
    begin
      if (host_out_valid)
      begin
        host_out_bits_r <= host_out_bits;
        host_out_count <= host_out_count + 1;
      end
      if (host_in_valid && host_in_ready)
        host_in_count <= host_in_count + 1;

// state machine to handle reads from AXI master (ARM)
      case (st_rd)
        st_rd_idle : begin
          if (M_AXI_arvalid)
          begin
            st_rd <= st_rd_read;
            raddr_r <= raddr;
            arid_r <= M_AXI_arid;
          end
        end
        st_rd_read : begin
          if (M_AXI_rready)
            st_rd <= st_rd_idle;
        end
      endcase

// state machine to handle writes from AXI master
      case (st_wr)
        st_wr_idle : begin
          if (M_AXI_awvalid && M_AXI_wvalid)
          begin
            st_wr <= st_wr_write;
            waddr_r <= waddr;
            awid_r <= M_AXI_awid;
          end
        end
        st_wr_write : begin
          if (!host_in_fifo_full || (waddr_r == `RESET_ADDR))
            st_wr <= st_wr_ack;
        end
        st_wr_ack : begin
          if (M_AXI_bready)
            st_wr <= st_wr_idle;
        end
      endcase

    end
  end

  assign M_AXI_arready = (st_rd == st_rd_idle);
  assign M_AXI_rvalid  = (st_rd == st_rd_read);
  assign M_AXI_rlast   = (st_rd == st_rd_read);
  assign M_AXI_rdata   = (raddr_r == `DCOUNT_ADDR) ? {26'd0, host_out_fifo_count} : host_out_fifo_dout;
  assign M_AXI_rid = arid_r;

  wire do_write = (st_wr == st_wr_write);
  assign M_AXI_awready = do_write;
  assign M_AXI_wready  = do_write;
  assign host_in_fifo_wren = do_write && (waddr_r == `WFIFO_ADDR);
  assign reset_cpu = do_write && (waddr_r == `RESET_ADDR);

  assign M_AXI_bvalid = (st_wr == st_wr_ack);
  assign M_AXI_bid = awid_r;

  // interface between test chip mem interface and zynq DDR via HP0 AXI port
  parameter st_IDLE = 2'b00;
  parameter st_READ = 2'b01;
  parameter st_START_WRITE = 2'b10;
  parameter st_WRITE = 2'b11;

  reg [1:0] state_r = st_IDLE; // for poweron global set/reset
  reg [2:0] write_count = 3'd0;
  reg read_count = 1'b0;

  always @(posedge host_clk)
  begin
     if (reset)
     begin
        state_r <= st_IDLE;
        write_count <= 3'd0;
        read_count <= 1'b0;
        mem_resp_data_buf <= 64'd0;
        S_AXI_rlast_r <= 1'b0;
     end
     else
        S_AXI_rlast_r <= S_AXI_rlast && S_AXI_rvalid;
        if (S_AXI_rvalid)
        begin
           read_count <= read_count + 1;
           mem_resp_data_buf <= S_AXI_rdata;
        end

        case (state_r)
           st_IDLE : begin
              if (mem_req_cmd_val && !mem_req_cmd_rw)
                state_r <= st_READ;
              else if (mem_req_cmd_val && mem_req_cmd_rw && mem_req_data_val)
                state_r <= st_START_WRITE;
           end
           st_READ : begin
              if (S_AXI_arready)
                 state_r <= st_IDLE;
           end
           st_START_WRITE : begin
              if (S_AXI_awready)
                 state_r <= st_WRITE;
           end
           st_WRITE : begin
              if (S_AXI_wready && mem_req_data_val)
              begin
                 write_count <= write_count + 1;
                 if (write_count == 3'd7)
                    state_r <= st_IDLE;
              end
           end
        endcase
  end
  
  assign S_AXI_awvalid = (state_r == st_START_WRITE);
  assign S_AXI_arvalid = (state_r == st_READ);
  assign mem_req_cmd_rdy = ((state_r == st_START_WRITE) && S_AXI_awready) || ((state_r == st_READ) && S_AXI_arready);
  assign S_AXI_wvalid = (state_r == st_WRITE) && mem_req_data_val;
  assign S_AXI_wlast = (state_r == st_WRITE) && (write_count == 3'd7);

  assign S_AXI_rready = 1'b1;
  assign mem_resp_val = read_count; // FIXME: assuming mem_resp_rdy is always 1 (i think its OK)

  assign mem_req_data_rdy = (state_r == st_WRITE) && write_count[0] && S_AXI_wready;
  assign S_AXI_addr = {4'h1, mem_req_addr[21:0], 6'd0};
  assign S_AXI_wdata = write_count[0] ? mem_req_data_bits[127:64] : mem_req_data_bits[63:0];
  assign S_AXI_bready = 1'b1; //(state_r == st_WRITE_ACK);
  
  assign S_AXI_arid = {1'b0, mem_req_tag};
  assign S_AXI_awid = 6'd0;
  assign mem_resp_tag = S_AXI_rid[4:0];

  Top top(
       .clk(host_clk),
       .reset(reset_cpu),
       //.io_host_clk(  )
       //.io_host_clk_edge(  )
       .io_host_in_ready( host_in_ready ),
       .io_host_in_valid( host_in_valid ),
       .io_host_in_bits( host_in_bits ),
       .io_host_out_ready( host_out_ready ),
       .io_host_out_valid( host_out_valid ),
       .io_host_out_bits( host_out_bits ),
       //.io_host_debug_stats_pcr(  )
       .io_mem_req_cmd_ready( mem_req_cmd_rdy ),
       .io_mem_req_cmd_valid( mem_req_cmd_val ),
       .io_mem_req_cmd_bits_addr( mem_req_addr ),
       .io_mem_req_cmd_bits_tag( mem_req_tag ),
       .io_mem_req_cmd_bits_rw( mem_req_cmd_rw ),
       .io_mem_req_data_ready( mem_req_data_rdy ),
       .io_mem_req_data_valid( mem_req_data_val ),
       .io_mem_req_data_bits_data( mem_req_data_bits ),
       .io_mem_resp_ready( mem_resp_rdy ),
       .io_mem_resp_valid( mem_resp_val ),
       .io_mem_resp_bits_data( {S_AXI_rdata, mem_resp_data_buf} ),
       .io_mem_resp_bits_tag( mem_resp_tag ),


       // TEMAC connections
      .io_temac_rx_axis_fifo_tdata(rx_axis_fifo_tdata),
      .io_temac_rx_axis_fifo_tvalid(rx_axis_fifo_tvalid),
      .io_temac_rx_axis_fifo_tready(rx_axis_fifo_tready),
      .io_temac_rx_axis_fifo_tlast(rx_axis_fifo_tlast),

      .io_temac_tx_axis_fifo_tdata(tx_axis_fifo_tdata),
      .io_temac_tx_axis_fifo_tvalid(tx_axis_fifo_tvalid),
      .io_temac_tx_axis_fifo_tready(tx_axis_fifo_tready),
      .io_temac_tx_axis_fifo_tlast(tx_axis_fifo_tlast),

      .io_temac_s_axi_awaddr(s_axi_awaddr),
      .io_temac_s_axi_awvalid(s_axi_awvalid),
      .io_temac_s_axi_awready(s_axi_awready),

      .io_temac_s_axi_wdata(s_axi_wdata),
      .io_temac_s_axi_wvalid(s_axi_wvalid),
      .io_temac_s_axi_wready(s_axi_wready),

      .io_temac_s_axi_bresp(s_axi_bresp),
      .io_temac_s_axi_bvalid(s_axi_bvalid),
      .io_temac_s_axi_bready(s_axi_bready),

      .io_temac_s_axi_araddr(s_axi_araddr),
      .io_temac_s_axi_arvalid(s_axi_arvalid),
      .io_temac_s_axi_arready(s_axi_arready),

      .io_temac_s_axi_rdata(s_axi_rdata),
      .io_temac_s_axi_rresp(s_axi_rresp),
      .io_temac_s_axi_rvalid(s_axi_rvalid),
      .io_temac_s_axi_rready(s_axi_rready)

  );


  BUFG  bufg_host_clk (.I(host_clk_i), .O(host_clk));

  MMCME2_BASE #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(`RC_CLK_MULT),
    .CLKFBOUT_PHASE(0.0),
    .CLKIN1_PERIOD(`ZYNQ_CLK_PERIOD),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT0_DIVIDE_F(`RC_CLK_DIVIDE),
    .CLKOUT0_DUTY_CYCLE(0.5),
    .CLKOUT1_DUTY_CYCLE(0.5),
    .CLKOUT2_DUTY_CYCLE(0.5),
    .CLKOUT3_DUTY_CYCLE(0.5),
    .CLKOUT4_DUTY_CYCLE(0.5),
    .CLKOUT5_DUTY_CYCLE(0.5),
    .CLKOUT6_DUTY_CYCLE(0.5),
    .CLKOUT0_PHASE(0.0),
    .CLKOUT1_PHASE(0.0),
    .CLKOUT2_PHASE(0.0),
    .CLKOUT3_PHASE(0.0),
    .CLKOUT4_PHASE(0.0),
    .CLKOUT5_PHASE(0.0),
    .CLKOUT6_PHASE(0.0),
    .CLKOUT4_CASCADE("FALSE"),
    .DIVCLK_DIVIDE(1),
    .REF_JITTER1(0.0),
    .STARTUP_WAIT("FALSE")
  ) MMCME2_BASE_inst (
    .CLKOUT0(host_clk_i),
    .CLKOUT0B(),
    .CLKOUT1(),
    .CLKOUT1B(),
    .CLKOUT2(),
    .CLKOUT2B(),
    .CLKOUT3(),
    .CLKOUT3B(),
    .CLKOUT4(),
    .CLKOUT5(),
    .CLKOUT6(),
    .CLKFBOUT(gclk_fbout),
    .CLKFBOUTB(),
    .LOCKED(mmcm_locked),
    .CLKIN1(clk_200),
    .PWRDWN(1'b0),
    .RST(1'b0),
    .CLKFBIN(gclk_fbout));





       gig_ethernet_pcs_pma_0 core_wrapper (
              // Transceiver Interface
              //----------------------
              .gtrefclk_p(sfp_125_clk_p),                // 125 MHz differential clock
              .gtrefclk_n(sfp_125_clk_n),                // 125 MHz differential clock
              .gtrefclk_out(gtrefclk),              // Very high quality 125MHz clock for GT transceiver.
              
              .txp(sfp_txp),                   // Differential +ve of serial transmission from PMA to PMD.
              .txn(sfp_txn),                   // Differential -ve of serial transmission from PMA to PMD.
              .rxp(sfp_rxp),                   // Differential +ve for serial reception from PMD to PMA.
              .rxn(sfp_rxn),                   // Differential -ve for serial reception from PMD to PMA.
              .resetdone(),                 // The GT transceiver has completed its reset cycle
              .userclk_out(userclk),               // 125MHz global clock.
              .userclk2_out(userclk2),              // 125MHz global clock.
              .rxuserclk_out(),               // 125MHz global clock.
              .rxuserclk2_out(),              // 125MHz global clock.
              .independent_clock_bufg(clk_200_bufg),// 200MHz Independent clock,
              .pma_reset_out(),             // transceiver PMA reset signal
              .mmcm_locked_out(),           // MMCM Locked
              // GMII Interface
              //---------------
              .gmii_txd(GMII_TXD_reg),              // Transmit data from client MAC.
              .gmii_tx_en(GMII_TX_EN_reg),            // Transmit control signal from client MAC.
              .gmii_tx_er(GMII_TX_ER_reg),            // Transmit control signal from client MAC.
              .gmii_rxd(GMII_RXD),              // Received Data to client MAC.
              .gmii_rx_dv(GMII_RX_DV),            // Received control signal to client MAC.
              .gmii_rx_er(GMII_RX_ER),            // Received control signal to client MAC.
              .gmii_isolate(),          // Tristate control to electrically isolate GMII.
        
              // Management: MDIO Interface
              //---------------------------
        
              .mdc(MDC),                   // Management Data Clock
              .mdio_i(MDIO_I),                // Management Data In
              .mdio_o(MDIO_O),                // Management Data Out
              .mdio_t(),                // Management Data Tristate
              .configuration_vector(5'd0),  // Alternative to MDIO interface.
              .configuration_valid(1'b0),   // Validation signal for Config vector
        
              .an_interrupt(),          // Interrupt to processor to signal that Auto-Negotiation has completed
              .an_adv_config_vector(16'b0000_0000_0010_0001),  // Alternate interface to program REG4 (AN ADV)
              .an_adv_config_val(1'b0),     // Validation signal for AN ADV
              .an_restart_config(1'b0),     // Alternate signal to modify AN restart bit in REG0
        
              // General IO's
              //-------------
              .status_vector(status_vector_int),         // Core status.
              .reset(!FCLK_RESET0_N),                 // Asynchronous reset for entire core
            
              .signal_detect(1'b1),          // Input from PMD to indicate presence of optical input.
              .gt0_qplloutclk_out(),
              .gt0_qplloutrefclk_out()
           );

        
always @(posedge userclk2)
begin
    GMII_TXD_reg <= GMII_TXD;
    GMII_TX_ER_reg <= GMII_TX_ER;
    GMII_TX_EN_reg <= GMII_TX_EN;
end

always @(posedge userclk2)
begin
    GMII_RXD_reg <= GMII_RXD;
    GMII_RX_DV_reg <= GMII_RX_DV;
    GMII_RX_ER_reg <= GMII_RX_ER;
end
   
always @(posedge userclk2)
begin
    status_vector <= status_vector_int;
end


tri_mode_ethernet_mac_0_fifo_block temac0 (
      .gtx_clk(userclk2),
      // asynchronous reset
      .glbl_rstn(FCLK_RESET0_N), // or rocket's reset?
      .rx_axi_rstn(FCLK_RESET0_N),
      .tx_axi_rstn(FCLK_RESET0_N),

      // Receiver Statistics Interface all outputs
      // dont care about this stuff?
      // TODO: hook up to ILA
      //---------------------------------------
      .rx_mac_aclk(), // dont care about this stuff?
      .rx_reset(),
      .rx_statistics_vector(), // 28 bits
      .rx_statistics_valid(),

      // Receiver (AXI-S) Interface
      //----------------------------------------
      .rx_fifo_clock(host_clk),
      .rx_fifo_resetn(FCLK_RESET0_N),
      .rx_axis_fifo_tdata(rx_axis_fifo_tdata),
      .rx_axis_fifo_tvalid(rx_axis_fifo_tvalid),
      .rx_axis_fifo_tready(rx_axis_fifo_tready),
      .rx_axis_fifo_tlast(rx_axis_fifo_tlast),


      // Transmitter Statistics Interface
      // dont care about this stuff?
      // TODO: hook up to ILA
      //------------------------------------------
      .tx_mac_aclk(),
      .tx_reset(),
      .tx_ifg_delay(8'b0), // 8 bit in
      .tx_statistics_vector(), // 32 bits
      .tx_statistics_valid(),


      // Transmitter (AXI-S) Interface
      //-------------------------------------------
      .tx_fifo_clock(host_clk),
      .tx_fifo_resetn(FCLK_RESET0_N),
      .tx_axis_fifo_tdata(tx_axis_fifo_tdata),
      .tx_axis_fifo_tvalid(tx_axis_fifo_tvalid),
      .tx_axis_fifo_tready(tx_axis_fifo_tready),
      .tx_axis_fifo_tlast(tx_axis_fifo_tlast),

      // MAC Control Interface
      // dont care?
      //------------------------
      .pause_req(1'b0),
      .pause_val(16'b0), // 16 bit in

      // GMII Interface
      //-----------------
      .gmii_txd(GMII_TXD),
      .gmii_tx_en(GMII_TX_EN),
      .gmii_tx_er(GMII_TX_ER),
      .gmii_rxd(GMII_RXD_reg),
      .gmii_rx_dv(GMII_RX_DV_reg),
      .gmii_rx_er(GMII_RX_ER_reg),
      .speedis100(), // dont care
      .speedis10100(), // dont care

      // MDIO Interface
      //-----------------
      .mdio_i(MDIO_O),
      .mdio_o(MDIO_I),
      .mdio_t(), // UNUSED
      .mdc(MDC),

      // AXI-Lite Interface
      //---------------
      .s_axi_aclk(host_clk), // this is used to derive MDC based on config
      .s_axi_resetn(FCLK_RESET0_N),

      .s_axi_awaddr(s_axi_awaddr),
      .s_axi_awvalid(s_axi_awvalid),
      .s_axi_awready(s_axi_awready),

      .s_axi_wdata(s_axi_wdata),
      .s_axi_wvalid(s_axi_wvalid),
      .s_axi_wready(s_axi_wready),

      .s_axi_bresp(s_axi_bresp),
      .s_axi_bvalid(s_axi_bvalid),
      .s_axi_bready(s_axi_bready),

      .s_axi_araddr(s_axi_araddr),
      .s_axi_arvalid(s_axi_arvalid),
      .s_axi_arready(s_axi_arready),

      .s_axi_rdata(s_axi_rdata),
      .s_axi_rresp(s_axi_rresp),
      .s_axi_rvalid(s_axi_rvalid),
      .s_axi_rready(s_axi_rready)
   );

endmodule

module fifo_32x32 (
    input clk,
    input reset,
    input wren,
    input rden,
    input [31:0] din,
    output reg empty,
    output reg full,
    output [31:0] dout,
    output [4:0] count
    );

  reg [31:0] data [0:31];
  reg [4:0] raddr, waddr, cnt;
  wire [4:0] waddr_next, raddr_next;
  wire write = wren && (rden || !full);
  wire read = rden && !empty;

  assign waddr_next = write ? waddr + 1'b1 : waddr;
  assign raddr_next = read ? raddr + 1'b1 : raddr;
  assign dout = data[raddr];
  assign count = cnt;

  always @(posedge clk)
  begin
    if (reset)
    begin
      empty <= 1'b1;
      full <= 1'b0;
      raddr <= 5'd0;
      waddr <= 5'd0;
      cnt <= 5'd0;
    end
    else
    begin
      waddr <= waddr_next;
      raddr <= raddr_next;
      if (write)
        data[waddr] <= din;

      if (read && raddr_next == waddr_next && !full)
        empty <= 1'b1;
      else if (write && !read)
        empty <= 1'b0;

      if (write && raddr_next == waddr_next)
        full <= 1'b1;
      else if (read && !write)
        full <= 1'b0;

      if (write ^ read)
        cnt <= write ? cnt + 1 : cnt - 1;

    end
  end
endmodule
