library (VennDiagram)
setwd("path/to/VennInputFile")
data <- read.table("*.venn.txt", header=T, sep="\t")

a1 <- as.numeric(data[9,1]) + as.numeric(data[10,1]) + as.numeric(data[11,1]) + as.numeric(data[12,1])+ as.numeric(data[1,1])+ as.numeric(data[2,1])+as.numeric(data[3,1]) + as.numeric(data[4,1]) + as.numeric(data[5,1]) + as.numeric(data[6,1])+ as.numeric(data[7,1])+ as.numeric(data[8,1])+ as.numeric(data[13,1])+ as.numeric(data[14,1])+ as.numeric(data[15,1])+ as.numeric(data[16,1])

a2 <- as.numeric(data[17,1]) + as.numeric(data[18,1]) + as.numeric(data[19,1]) + as.numeric(data[20,1]) + as.numeric(data[21,1])+ as.numeric(data[22,1])+as.numeric(data[23,1]) + as.numeric(data[24,1]) + as.numeric(data[1,1]) + as.numeric(data[2,1])+ as.numeric(data[3,1])+ as.numeric(data[4,1])+ as.numeric(data[5,1])+ as.numeric(data[6,1])+ as.numeric(data[7,1])+as.numeric(data[8,1])

a3 <- as.numeric(data[21,1]) + as.numeric(data[22,1]) + as.numeric(data[23,1]) + as.numeric(data[24,1])+ as.numeric(data[28,1])+ as.numeric(data[29,1])+as.numeric(data[30,1]) + as.numeric(data[31,1]) + as.numeric(data[5,1]) + as.numeric(data[6,1])+ as.numeric(data[7,1])+ as.numeric(data[8,1])+ as.numeric(data[13,1])+ as.numeric(data[14,1])+ as.numeric(data[15,1])+as.numeric(data[16,1])

a4 <- as.numeric(data[26,1]) + as.numeric(data[27,1]) + as.numeric(data[19,1]) + as.numeric(data[20,1])+ as.numeric(data[23,1])+ as.numeric(data[24,1])+as.numeric(data[30,1]) + as.numeric(data[31,1]) + as.numeric(data[11,1]) + as.numeric(data[12,1])+ as.numeric(data[3,1])+ as.numeric(data[4,1])+ as.numeric(data[7,1])+ as.numeric(data[8,1])+ as.numeric(data[15,1])+as.numeric(data[16,1])

a5 <- as.numeric(data[16,1]) + as.numeric(data[14,1]) + as.numeric(data[8,1]) + as.numeric(data[6,1])+ as.numeric(data[4,1])+ as.numeric(data[2,1])+as.numeric(data[12,1]) + as.numeric(data[10,1]) + as.numeric(data[31,1]) + as.numeric(data[29,1])+ as.numeric(data[24,1])+ as.numeric(data[22,1])+ as.numeric(data[20,1])+ as.numeric(data[18,1])+ as.numeric(data[27,1])+as.numeric(data[25,1])

n12 <- as.numeric(data[8,1])+ as.numeric(data[7,1])+as.numeric(data[6,1])+ as.numeric(data[5,1])+ as.numeric(data[4,1])+ as.numeric(data[3,1])+as.numeric(data[2,1])+as.numeric(data[1,1])

n13 <- as.numeric(data[16,1])+ as.numeric(data[15,1])+as.numeric(data[14,1])+ as.numeric(data[13,1])+ as.numeric(data[8,1])+ as.numeric(data[7,1])+as.numeric(data[6,1])+as.numeric(data[5,1])

n14 <- as.numeric(data[16,1])+ as.numeric(data[15,1])+as.numeric(data[8,1])+ as.numeric(data[7,1])+ as.numeric(data[4,1])+ as.numeric(data[3,1])+as.numeric(data[12,1])+as.numeric(data[11,1])

n15 <- as.numeric(data[16,1])+ as.numeric(data[14,1])+as.numeric(data[8,1])+ as.numeric(data[6,1])+ as.numeric(data[4,1])+ as.numeric(data[2,1])+as.numeric(data[12,1])+as.numeric(data[10,1])

n23 <- as.numeric(data[21,1])+ as.numeric(data[22,1])+as.numeric(data[23,1])+ as.numeric(data[24,1])+ as.numeric(data[5,1])+ as.numeric(data[6,1])+as.numeric(data[7,1])+as.numeric(data[8,1])

n24 <- as.numeric(data[19,1])+ as.numeric(data[20,1])+as.numeric(data[23,1])+ as.numeric(data[24,1])+ as.numeric(data[3,1])+ as.numeric(data[4,1])+as.numeric(data[7,1])+as.numeric(data[8,1])

n25 <- as.numeric(data[18,1])+ as.numeric(data[20,1])+as.numeric(data[22,1])+ as.numeric(data[24,1])+ as.numeric(data[2,1])+ as.numeric(data[4,1])+as.numeric(data[6,1])+as.numeric(data[8,1])

n34 <- as.numeric(data[23,1])+ as.numeric(data[24,1])+as.numeric(data[30,1])+ as.numeric(data[31,1])+ as.numeric(data[7,1])+ as.numeric(data[8,1])+as.numeric(data[15,1])+as.numeric(data[16,1])

n35 <- as.numeric(data[22,1])+ as.numeric(data[24,1])+as.numeric(data[29,1])+ as.numeric(data[31,1])+ as.numeric(data[6,1])+ as.numeric(data[8,1])+as.numeric(data[14,1])+as.numeric(data[16,1])

n45 <- as.numeric(data[27,1])+ as.numeric(data[20,1])+as.numeric(data[24,1])+ as.numeric(data[31,1])+ as.numeric(data[12,1])+ as.numeric(data[4,1])+as.numeric(data[8,1])+as.numeric(data[16,1])

n123 <- as.numeric(data[8,1])+ as.numeric(data[7,1])+as.numeric(data[6,1])+ as.numeric(data[5,1])
n124 <- as.numeric(data[8,1])+ as.numeric(data[7,1])+as.numeric(data[4,1])+ as.numeric(data[3,1])
n125 <- as.numeric(data[8,1])+ as.numeric(data[6,1])+as.numeric(data[4,1])+ as.numeric(data[2,1])
n134 <- as.numeric(data[7,1])+ as.numeric(data[8,1])+as.numeric(data[15,1])+ as.numeric(data[16,1])
n135 <- as.numeric(data[6,1])+ as.numeric(data[8,1])+as.numeric(data[14,1])+ as.numeric(data[16,1])
n145 <- as.numeric(data[12,1])+ as.numeric(data[4,1])+as.numeric(data[8,1])+ as.numeric(data[16,1])
n234 <- as.numeric(data[23,1])+ as.numeric(data[24,1])+as.numeric(data[7,1])+ as.numeric(data[8,1])
n235 <- as.numeric(data[22,1])+ as.numeric(data[24,1])+as.numeric(data[6,1])+ as.numeric(data[8,1])
n245 <- as.numeric(data[20,1])+ as.numeric(data[24,1])+as.numeric(data[4,1])+ as.numeric(data[8,1])
n345 <- as.numeric(data[16,1])+ as.numeric(data[8,1])+as.numeric(data[31,1])+ as.numeric(data[24,1])
n1234 <- as.numeric(data[7,1])+ as.numeric(data[8,1])
n1235 <- as.numeric(data[6,1])+ as.numeric(data[8,1])
n1245 <- as.numeric(data[4,1])+ as.numeric(data[8,1])
n1345 <- as.numeric(data[16,1])+ as.numeric(data[8,1])
n2345 <- as.numeric(data[24,1])+ as.numeric(data[8,1])
n12345 <- as.numeric(data[8,1])

pdf(file="path/to/VennOutputFile/*.pdf",height=5,width=5)
draw.quintuple.venn (a1,a2,a3, a4, a5,n12, n13, n14, n15, n23, n24, n25, n34, n35, n45, n123, n124, n125, n134,n135, n145, n234, n235, n245, n345, n1234, n1235,n1245, n1345, n2345, n12345, fill= c("blue", "red", "green", "yellow","magenta"),lty = "blank", category = c("Sbcl2", "WM3211", "WM793", "WM1366","WM1158"))
dev.off()

