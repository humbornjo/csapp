
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400ac0 <_init>:
  400ac0:	48 83 ec 08          	sub    $0x8,%rsp
  400ac4:	e8 f3 01 00 00       	call   400cbc <call_gmon_start>
  400ac9:	48 83 c4 08          	add    $0x8,%rsp
  400acd:	c3                   	ret    

Disassembly of section .plt:

0000000000400ad0 <.plt>:
  400ad0:	ff 35 1a 25 20 00    	push   0x20251a(%rip)        # 602ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ad6:	ff 25 1c 25 20 00    	jmp    *0x20251c(%rip)        # 602ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400adc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ae0 <getenv@plt>:
  400ae0:	ff 25 1a 25 20 00    	jmp    *0x20251a(%rip)        # 603000 <getenv@GLIBC_2.2.5>
  400ae6:	68 00 00 00 00       	push   $0x0
  400aeb:	e9 e0 ff ff ff       	jmp    400ad0 <.plt>

0000000000400af0 <__errno_location@plt>:
  400af0:	ff 25 12 25 20 00    	jmp    *0x202512(%rip)        # 603008 <__errno_location@GLIBC_2.2.5>
  400af6:	68 01 00 00 00       	push   $0x1
  400afb:	e9 d0 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b00 <strcpy@plt>:
  400b00:	ff 25 0a 25 20 00    	jmp    *0x20250a(%rip)        # 603010 <strcpy@GLIBC_2.2.5>
  400b06:	68 02 00 00 00       	push   $0x2
  400b0b:	e9 c0 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b10 <puts@plt>:
  400b10:	ff 25 02 25 20 00    	jmp    *0x202502(%rip)        # 603018 <puts@GLIBC_2.2.5>
  400b16:	68 03 00 00 00       	push   $0x3
  400b1b:	e9 b0 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b20 <write@plt>:
  400b20:	ff 25 fa 24 20 00    	jmp    *0x2024fa(%rip)        # 603020 <write@GLIBC_2.2.5>
  400b26:	68 04 00 00 00       	push   $0x4
  400b2b:	e9 a0 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b30 <__stack_chk_fail@plt>:
  400b30:	ff 25 f2 24 20 00    	jmp    *0x2024f2(%rip)        # 603028 <__stack_chk_fail@GLIBC_2.4>
  400b36:	68 05 00 00 00       	push   $0x5
  400b3b:	e9 90 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b40 <alarm@plt>:
  400b40:	ff 25 ea 24 20 00    	jmp    *0x2024ea(%rip)        # 603030 <alarm@GLIBC_2.2.5>
  400b46:	68 06 00 00 00       	push   $0x6
  400b4b:	e9 80 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b50 <close@plt>:
  400b50:	ff 25 e2 24 20 00    	jmp    *0x2024e2(%rip)        # 603038 <close@GLIBC_2.2.5>
  400b56:	68 07 00 00 00       	push   $0x7
  400b5b:	e9 70 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b60 <read@plt>:
  400b60:	ff 25 da 24 20 00    	jmp    *0x2024da(%rip)        # 603040 <read@GLIBC_2.2.5>
  400b66:	68 08 00 00 00       	push   $0x8
  400b6b:	e9 60 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b70 <__libc_start_main@plt>:
  400b70:	ff 25 d2 24 20 00    	jmp    *0x2024d2(%rip)        # 603048 <__libc_start_main@GLIBC_2.2.5>
  400b76:	68 09 00 00 00       	push   $0x9
  400b7b:	e9 50 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b80 <fgets@plt>:
  400b80:	ff 25 ca 24 20 00    	jmp    *0x2024ca(%rip)        # 603050 <fgets@GLIBC_2.2.5>
  400b86:	68 0a 00 00 00       	push   $0xa
  400b8b:	e9 40 ff ff ff       	jmp    400ad0 <.plt>

0000000000400b90 <signal@plt>:
  400b90:	ff 25 c2 24 20 00    	jmp    *0x2024c2(%rip)        # 603058 <signal@GLIBC_2.2.5>
  400b96:	68 0b 00 00 00       	push   $0xb
  400b9b:	e9 30 ff ff ff       	jmp    400ad0 <.plt>

0000000000400ba0 <gethostbyname@plt>:
  400ba0:	ff 25 ba 24 20 00    	jmp    *0x2024ba(%rip)        # 603060 <gethostbyname@GLIBC_2.2.5>
  400ba6:	68 0c 00 00 00       	push   $0xc
  400bab:	e9 20 ff ff ff       	jmp    400ad0 <.plt>

0000000000400bb0 <__memmove_chk@plt>:
  400bb0:	ff 25 b2 24 20 00    	jmp    *0x2024b2(%rip)        # 603068 <__memmove_chk@GLIBC_2.3.4>
  400bb6:	68 0d 00 00 00       	push   $0xd
  400bbb:	e9 10 ff ff ff       	jmp    400ad0 <.plt>

0000000000400bc0 <__memcpy_chk@plt>:
  400bc0:	ff 25 aa 24 20 00    	jmp    *0x2024aa(%rip)        # 603070 <__memcpy_chk@GLIBC_2.3.4>
  400bc6:	68 0e 00 00 00       	push   $0xe
  400bcb:	e9 00 ff ff ff       	jmp    400ad0 <.plt>

0000000000400bd0 <strtol@plt>:
  400bd0:	ff 25 a2 24 20 00    	jmp    *0x2024a2(%rip)        # 603078 <strtol@GLIBC_2.2.5>
  400bd6:	68 0f 00 00 00       	push   $0xf
  400bdb:	e9 f0 fe ff ff       	jmp    400ad0 <.plt>

0000000000400be0 <fflush@plt>:
  400be0:	ff 25 9a 24 20 00    	jmp    *0x20249a(%rip)        # 603080 <fflush@GLIBC_2.2.5>
  400be6:	68 10 00 00 00       	push   $0x10
  400beb:	e9 e0 fe ff ff       	jmp    400ad0 <.plt>

0000000000400bf0 <__isoc99_sscanf@plt>:
  400bf0:	ff 25 92 24 20 00    	jmp    *0x202492(%rip)        # 603088 <__isoc99_sscanf@GLIBC_2.7>
  400bf6:	68 11 00 00 00       	push   $0x11
  400bfb:	e9 d0 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c00 <__printf_chk@plt>:
  400c00:	ff 25 8a 24 20 00    	jmp    *0x20248a(%rip)        # 603090 <__printf_chk@GLIBC_2.3.4>
  400c06:	68 12 00 00 00       	push   $0x12
  400c0b:	e9 c0 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c10 <fopen@plt>:
  400c10:	ff 25 82 24 20 00    	jmp    *0x202482(%rip)        # 603098 <fopen@GLIBC_2.2.5>
  400c16:	68 13 00 00 00       	push   $0x13
  400c1b:	e9 b0 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c20 <exit@plt>:
  400c20:	ff 25 7a 24 20 00    	jmp    *0x20247a(%rip)        # 6030a0 <exit@GLIBC_2.2.5>
  400c26:	68 14 00 00 00       	push   $0x14
  400c2b:	e9 a0 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c30 <connect@plt>:
  400c30:	ff 25 72 24 20 00    	jmp    *0x202472(%rip)        # 6030a8 <connect@GLIBC_2.2.5>
  400c36:	68 15 00 00 00       	push   $0x15
  400c3b:	e9 90 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c40 <__fprintf_chk@plt>:
  400c40:	ff 25 6a 24 20 00    	jmp    *0x20246a(%rip)        # 6030b0 <__fprintf_chk@GLIBC_2.3.4>
  400c46:	68 16 00 00 00       	push   $0x16
  400c4b:	e9 80 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c50 <sleep@plt>:
  400c50:	ff 25 62 24 20 00    	jmp    *0x202462(%rip)        # 6030b8 <sleep@GLIBC_2.2.5>
  400c56:	68 17 00 00 00       	push   $0x17
  400c5b:	e9 70 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c60 <__ctype_b_loc@plt>:
  400c60:	ff 25 5a 24 20 00    	jmp    *0x20245a(%rip)        # 6030c0 <__ctype_b_loc@GLIBC_2.3>
  400c66:	68 18 00 00 00       	push   $0x18
  400c6b:	e9 60 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c70 <__sprintf_chk@plt>:
  400c70:	ff 25 52 24 20 00    	jmp    *0x202452(%rip)        # 6030c8 <__sprintf_chk@GLIBC_2.3.4>
  400c76:	68 19 00 00 00       	push   $0x19
  400c7b:	e9 50 fe ff ff       	jmp    400ad0 <.plt>

0000000000400c80 <socket@plt>:
  400c80:	ff 25 4a 24 20 00    	jmp    *0x20244a(%rip)        # 6030d0 <socket@GLIBC_2.2.5>
  400c86:	68 1a 00 00 00       	push   $0x1a
  400c8b:	e9 40 fe ff ff       	jmp    400ad0 <.plt>

Disassembly of section .text:

0000000000400c90 <_start>:
  400c90:	31 ed                	xor    %ebp,%ebp
  400c92:	49 89 d1             	mov    %rdx,%r9
  400c95:	5e                   	pop    %rsi
  400c96:	48 89 e2             	mov    %rsp,%rdx
  400c99:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c9d:	50                   	push   %rax
  400c9e:	54                   	push   %rsp
  400c9f:	49 c7 c0 a0 22 40 00 	mov    $0x4022a0,%r8
  400ca6:	48 c7 c1 10 22 40 00 	mov    $0x402210,%rcx
  400cad:	48 c7 c7 a0 0d 40 00 	mov    $0x400da0,%rdi
  400cb4:	e8 b7 fe ff ff       	call   400b70 <__libc_start_main@plt>
  400cb9:	f4                   	hlt    
  400cba:	90                   	nop
  400cbb:	90                   	nop

0000000000400cbc <call_gmon_start>:
  400cbc:	48 83 ec 08          	sub    $0x8,%rsp
  400cc0:	48 8b 05 19 23 20 00 	mov    0x202319(%rip),%rax        # 602fe0 <__gmon_start__>
  400cc7:	48 85 c0             	test   %rax,%rax
  400cca:	74 02                	je     400cce <call_gmon_start+0x12>
  400ccc:	ff d0                	call   *%rax
  400cce:	48 83 c4 08          	add    $0x8,%rsp
  400cd2:	c3                   	ret    
  400cd3:	90                   	nop
  400cd4:	90                   	nop
  400cd5:	90                   	nop
  400cd6:	90                   	nop
  400cd7:	90                   	nop
  400cd8:	90                   	nop
  400cd9:	90                   	nop
  400cda:	90                   	nop
  400cdb:	90                   	nop
  400cdc:	90                   	nop
  400cdd:	90                   	nop
  400cde:	90                   	nop
  400cdf:	90                   	nop

0000000000400ce0 <deregister_tm_clones>:
  400ce0:	b8 47 37 60 00       	mov    $0x603747,%eax
  400ce5:	55                   	push   %rbp
  400ce6:	48 2d 40 37 60 00    	sub    $0x603740,%rax
  400cec:	48 83 f8 0e          	cmp    $0xe,%rax
  400cf0:	48 89 e5             	mov    %rsp,%rbp
  400cf3:	77 02                	ja     400cf7 <deregister_tm_clones+0x17>
  400cf5:	5d                   	pop    %rbp
  400cf6:	c3                   	ret    
  400cf7:	b8 00 00 00 00       	mov    $0x0,%eax
  400cfc:	48 85 c0             	test   %rax,%rax
  400cff:	74 f4                	je     400cf5 <deregister_tm_clones+0x15>
  400d01:	5d                   	pop    %rbp
  400d02:	bf 40 37 60 00       	mov    $0x603740,%edi
  400d07:	ff e0                	jmp    *%rax
  400d09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d10 <register_tm_clones>:
  400d10:	b8 40 37 60 00       	mov    $0x603740,%eax
  400d15:	55                   	push   %rbp
  400d16:	48 2d 40 37 60 00    	sub    $0x603740,%rax
  400d1c:	48 c1 f8 03          	sar    $0x3,%rax
  400d20:	48 89 e5             	mov    %rsp,%rbp
  400d23:	48 89 c2             	mov    %rax,%rdx
  400d26:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400d2a:	48 01 d0             	add    %rdx,%rax
  400d2d:	48 d1 f8             	sar    %rax
  400d30:	75 02                	jne    400d34 <register_tm_clones+0x24>
  400d32:	5d                   	pop    %rbp
  400d33:	c3                   	ret    
  400d34:	ba 00 00 00 00       	mov    $0x0,%edx
  400d39:	48 85 d2             	test   %rdx,%rdx
  400d3c:	74 f4                	je     400d32 <register_tm_clones+0x22>
  400d3e:	5d                   	pop    %rbp
  400d3f:	48 89 c6             	mov    %rax,%rsi
  400d42:	bf 40 37 60 00       	mov    $0x603740,%edi
  400d47:	ff e2                	jmp    *%rdx
  400d49:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d50 <__do_global_dtors_aux>:
  400d50:	80 3d 01 2a 20 00 00 	cmpb   $0x0,0x202a01(%rip)        # 603758 <completed.6976>
  400d57:	75 11                	jne    400d6a <__do_global_dtors_aux+0x1a>
  400d59:	55                   	push   %rbp
  400d5a:	48 89 e5             	mov    %rsp,%rbp
  400d5d:	e8 7e ff ff ff       	call   400ce0 <deregister_tm_clones>
  400d62:	5d                   	pop    %rbp
  400d63:	c6 05 ee 29 20 00 01 	movb   $0x1,0x2029ee(%rip)        # 603758 <completed.6976>
  400d6a:	f3 c3                	repz ret 
  400d6c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400d70 <frame_dummy>:
  400d70:	48 83 3d 90 20 20 00 	cmpq   $0x0,0x202090(%rip)        # 602e08 <__JCR_END__>
  400d77:	00 
  400d78:	74 1e                	je     400d98 <frame_dummy+0x28>
  400d7a:	b8 00 00 00 00       	mov    $0x0,%eax
  400d7f:	48 85 c0             	test   %rax,%rax
  400d82:	74 14                	je     400d98 <frame_dummy+0x28>
  400d84:	55                   	push   %rbp
  400d85:	bf 08 2e 60 00       	mov    $0x602e08,%edi
  400d8a:	48 89 e5             	mov    %rsp,%rbp
  400d8d:	ff d0                	call   *%rax
  400d8f:	5d                   	pop    %rbp
  400d90:	e9 7b ff ff ff       	jmp    400d10 <register_tm_clones>
  400d95:	0f 1f 00             	nopl   (%rax)
  400d98:	e9 73 ff ff ff       	jmp    400d10 <register_tm_clones>
  400d9d:	90                   	nop
  400d9e:	90                   	nop
  400d9f:	90                   	nop

0000000000400da0 <main>:
  400da0:	53                   	push   %rbx
  400da1:	83 ff 01             	cmp    $0x1,%edi
  400da4:	75 10                	jne    400db6 <main+0x16>
  400da6:	48 8b 05 9b 29 20 00 	mov    0x20299b(%rip),%rax        # 603748 <stdin@GLIBC_2.2.5>
  400dad:	48 89 05 b4 29 20 00 	mov    %rax,0x2029b4(%rip)        # 603768 <infile>
  400db4:	eb 63                	jmp    400e19 <main+0x79>
  400db6:	48 89 f3             	mov    %rsi,%rbx
  400db9:	83 ff 02             	cmp    $0x2,%edi
  400dbc:	75 3a                	jne    400df8 <main+0x58>
  400dbe:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400dc2:	be b4 22 40 00       	mov    $0x4022b4,%esi
  400dc7:	e8 44 fe ff ff       	call   400c10 <fopen@plt>
  400dcc:	48 89 05 95 29 20 00 	mov    %rax,0x202995(%rip)        # 603768 <infile>
  400dd3:	48 85 c0             	test   %rax,%rax
  400dd6:	75 41                	jne    400e19 <main+0x79>
  400dd8:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  400ddc:	48 8b 13             	mov    (%rbx),%rdx
  400ddf:	be b6 22 40 00       	mov    $0x4022b6,%esi
  400de4:	bf 01 00 00 00       	mov    $0x1,%edi
  400de9:	e8 12 fe ff ff       	call   400c00 <__printf_chk@plt>
  400dee:	bf 08 00 00 00       	mov    $0x8,%edi
  400df3:	e8 28 fe ff ff       	call   400c20 <exit@plt>
  400df8:	48 8b 16             	mov    (%rsi),%rdx
  400dfb:	be d3 22 40 00       	mov    $0x4022d3,%esi
  400e00:	bf 01 00 00 00       	mov    $0x1,%edi
  400e05:	b8 00 00 00 00       	mov    $0x0,%eax
  400e0a:	e8 f1 fd ff ff       	call   400c00 <__printf_chk@plt>
  400e0f:	bf 08 00 00 00       	mov    $0x8,%edi
  400e14:	e8 07 fe ff ff       	call   400c20 <exit@plt>
  400e19:	e8 84 05 00 00       	call   4013a2 <initialize_bomb>
  400e1e:	bf 38 23 40 00       	mov    $0x402338,%edi
  400e23:	e8 e8 fc ff ff       	call   400b10 <puts@plt>
  400e28:	bf 78 23 40 00       	mov    $0x402378,%edi
  400e2d:	e8 de fc ff ff       	call   400b10 <puts@plt>
  400e32:	e8 67 06 00 00       	call   40149e <read_line>
  400e37:	48 89 c7             	mov    %rax,%rdi
  400e3a:	e8 a1 00 00 00       	call   400ee0 <phase_1>
  400e3f:	e8 80 07 00 00       	call   4015c4 <phase_defused>
  400e44:	bf a8 23 40 00       	mov    $0x4023a8,%edi
  400e49:	e8 c2 fc ff ff       	call   400b10 <puts@plt>
  400e4e:	e8 4b 06 00 00       	call   40149e <read_line>
  400e53:	48 89 c7             	mov    %rax,%rdi
  400e56:	e8 a1 00 00 00       	call   400efc <phase_2>
  400e5b:	e8 64 07 00 00       	call   4015c4 <phase_defused>
  400e60:	bf ed 22 40 00       	mov    $0x4022ed,%edi
  400e65:	e8 a6 fc ff ff       	call   400b10 <puts@plt>
  400e6a:	e8 2f 06 00 00       	call   40149e <read_line>
  400e6f:	48 89 c7             	mov    %rax,%rdi
  400e72:	e8 cc 00 00 00       	call   400f43 <phase_3>
  400e77:	e8 48 07 00 00       	call   4015c4 <phase_defused>
  400e7c:	bf 0b 23 40 00       	mov    $0x40230b,%edi
  400e81:	e8 8a fc ff ff       	call   400b10 <puts@plt>
  400e86:	e8 13 06 00 00       	call   40149e <read_line>
  400e8b:	48 89 c7             	mov    %rax,%rdi
  400e8e:	e8 79 01 00 00       	call   40100c <phase_4>
  400e93:	e8 2c 07 00 00       	call   4015c4 <phase_defused>
  400e98:	bf d8 23 40 00       	mov    $0x4023d8,%edi
  400e9d:	e8 6e fc ff ff       	call   400b10 <puts@plt>
  400ea2:	e8 f7 05 00 00       	call   40149e <read_line>
  400ea7:	48 89 c7             	mov    %rax,%rdi
  400eaa:	e8 b3 01 00 00       	call   401062 <phase_5>
  400eaf:	e8 10 07 00 00       	call   4015c4 <phase_defused>
  400eb4:	bf 1a 23 40 00       	mov    $0x40231a,%edi
  400eb9:	e8 52 fc ff ff       	call   400b10 <puts@plt>
  400ebe:	e8 db 05 00 00       	call   40149e <read_line>
  400ec3:	48 89 c7             	mov    %rax,%rdi
  400ec6:	e8 29 02 00 00       	call   4010f4 <phase_6>
  400ecb:	e8 f4 06 00 00       	call   4015c4 <phase_defused>
  400ed0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ed5:	5b                   	pop    %rbx
  400ed6:	c3                   	ret    
  400ed7:	90                   	nop
  400ed8:	90                   	nop
  400ed9:	90                   	nop
  400eda:	90                   	nop
  400edb:	90                   	nop
  400edc:	90                   	nop
  400edd:	90                   	nop
  400ede:	90                   	nop
  400edf:	90                   	nop

0000000000400ee0 <phase_1>:
  400ee0:	48 83 ec 08          	sub    $0x8,%rsp
  400ee4:	be 00 24 40 00       	mov    $0x402400,%esi
  400ee9:	e8 4a 04 00 00       	call   401338 <strings_not_equal>
  400eee:	85 c0                	test   %eax,%eax
  400ef0:	74 05                	je     400ef7 <phase_1+0x17>
  400ef2:	e8 43 05 00 00       	call   40143a <explode_bomb>
  400ef7:	48 83 c4 08          	add    $0x8,%rsp
  400efb:	c3                   	ret    

0000000000400efc <phase_2>:
  400efc:	55                   	push   %rbp
  400efd:	53                   	push   %rbx
  400efe:	48 83 ec 28          	sub    $0x28,%rsp
  400f02:	48 89 e6             	mov    %rsp,%rsi
  400f05:	e8 52 05 00 00       	call   40145c <read_six_numbers>
  400f0a:	83 3c 24 01          	cmpl   $0x1,(%rsp)
  400f0e:	74 20                	je     400f30 <phase_2+0x34>
  400f10:	e8 25 05 00 00       	call   40143a <explode_bomb>
  400f15:	eb 19                	jmp    400f30 <phase_2+0x34>
  400f17:	8b 43 fc             	mov    -0x4(%rbx),%eax
  400f1a:	01 c0                	add    %eax,%eax
  400f1c:	39 03                	cmp    %eax,(%rbx)
  400f1e:	74 05                	je     400f25 <phase_2+0x29>
  400f20:	e8 15 05 00 00       	call   40143a <explode_bomb>
  400f25:	48 83 c3 04          	add    $0x4,%rbx
  400f29:	48 39 eb             	cmp    %rbp,%rbx
  400f2c:	75 e9                	jne    400f17 <phase_2+0x1b>
  400f2e:	eb 0c                	jmp    400f3c <phase_2+0x40>
  400f30:	48 8d 5c 24 04       	lea    0x4(%rsp),%rbx
  400f35:	48 8d 6c 24 18       	lea    0x18(%rsp),%rbp
  400f3a:	eb db                	jmp    400f17 <phase_2+0x1b>
  400f3c:	48 83 c4 28          	add    $0x28,%rsp
  400f40:	5b                   	pop    %rbx
  400f41:	5d                   	pop    %rbp
  400f42:	c3                   	ret    

0000000000400f43 <phase_3>:
  400f43:	48 83 ec 18          	sub    $0x18,%rsp
  400f47:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  400f4c:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  400f51:	be cf 25 40 00       	mov    $0x4025cf,%esi
  400f56:	b8 00 00 00 00       	mov    $0x0,%eax
  400f5b:	e8 90 fc ff ff       	call   400bf0 <__isoc99_sscanf@plt>
  400f60:	83 f8 01             	cmp    $0x1,%eax
  400f63:	7f 05                	jg     400f6a <phase_3+0x27>
  400f65:	e8 d0 04 00 00       	call   40143a <explode_bomb>
  400f6a:	83 7c 24 08 07       	cmpl   $0x7,0x8(%rsp)
  400f6f:	77 3c                	ja     400fad <phase_3+0x6a>
  400f71:	8b 44 24 08          	mov    0x8(%rsp),%eax
  400f75:	ff 24 c5 70 24 40 00 	jmp    *0x402470(,%rax,8)
  400f7c:	b8 cf 00 00 00       	mov    $0xcf,%eax
  400f81:	eb 3b                	jmp    400fbe <phase_3+0x7b>
  400f83:	b8 c3 02 00 00       	mov    $0x2c3,%eax
  400f88:	eb 34                	jmp    400fbe <phase_3+0x7b>
  400f8a:	b8 00 01 00 00       	mov    $0x100,%eax
  400f8f:	eb 2d                	jmp    400fbe <phase_3+0x7b>
  400f91:	b8 85 01 00 00       	mov    $0x185,%eax
  400f96:	eb 26                	jmp    400fbe <phase_3+0x7b>
  400f98:	b8 ce 00 00 00       	mov    $0xce,%eax
  400f9d:	eb 1f                	jmp    400fbe <phase_3+0x7b>
  400f9f:	b8 aa 02 00 00       	mov    $0x2aa,%eax
  400fa4:	eb 18                	jmp    400fbe <phase_3+0x7b>
  400fa6:	b8 47 01 00 00       	mov    $0x147,%eax
  400fab:	eb 11                	jmp    400fbe <phase_3+0x7b>
  400fad:	e8 88 04 00 00       	call   40143a <explode_bomb>
  400fb2:	b8 00 00 00 00       	mov    $0x0,%eax
  400fb7:	eb 05                	jmp    400fbe <phase_3+0x7b>
  400fb9:	b8 37 01 00 00       	mov    $0x137,%eax
  400fbe:	3b 44 24 0c          	cmp    0xc(%rsp),%eax
  400fc2:	74 05                	je     400fc9 <phase_3+0x86>
  400fc4:	e8 71 04 00 00       	call   40143a <explode_bomb>
  400fc9:	48 83 c4 18          	add    $0x18,%rsp
  400fcd:	c3                   	ret    

0000000000400fce <func4>:
  400fce:	48 83 ec 08          	sub    $0x8,%rsp
  400fd2:	89 d0                	mov    %edx,%eax
  400fd4:	29 f0                	sub    %esi,%eax
  400fd6:	89 c1                	mov    %eax,%ecx
  400fd8:	c1 e9 1f             	shr    $0x1f,%ecx
  400fdb:	01 c8                	add    %ecx,%eax
  400fdd:	d1 f8                	sar    %eax
  400fdf:	8d 0c 30             	lea    (%rax,%rsi,1),%ecx
  400fe2:	39 f9                	cmp    %edi,%ecx
  400fe4:	7e 0c                	jle    400ff2 <func4+0x24>
  400fe6:	8d 51 ff             	lea    -0x1(%rcx),%edx
  400fe9:	e8 e0 ff ff ff       	call   400fce <func4>
  400fee:	01 c0                	add    %eax,%eax
  400ff0:	eb 15                	jmp    401007 <func4+0x39>
  400ff2:	b8 00 00 00 00       	mov    $0x0,%eax
  400ff7:	39 f9                	cmp    %edi,%ecx
  400ff9:	7d 0c                	jge    401007 <func4+0x39>
  400ffb:	8d 71 01             	lea    0x1(%rcx),%esi
  400ffe:	e8 cb ff ff ff       	call   400fce <func4>
  401003:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  401007:	48 83 c4 08          	add    $0x8,%rsp
  40100b:	c3                   	ret    

000000000040100c <phase_4>:
  40100c:	48 83 ec 18          	sub    $0x18,%rsp
  401010:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  401015:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  40101a:	be cf 25 40 00       	mov    $0x4025cf,%esi
  40101f:	b8 00 00 00 00       	mov    $0x0,%eax
  401024:	e8 c7 fb ff ff       	call   400bf0 <__isoc99_sscanf@plt>
  401029:	83 f8 02             	cmp    $0x2,%eax
  40102c:	75 07                	jne    401035 <phase_4+0x29>
  40102e:	83 7c 24 08 0e       	cmpl   $0xe,0x8(%rsp)
  401033:	76 05                	jbe    40103a <phase_4+0x2e>
  401035:	e8 00 04 00 00       	call   40143a <explode_bomb>
  40103a:	ba 0e 00 00 00       	mov    $0xe,%edx
  40103f:	be 00 00 00 00       	mov    $0x0,%esi
  401044:	8b 7c 24 08          	mov    0x8(%rsp),%edi
  401048:	e8 81 ff ff ff       	call   400fce <func4>
  40104d:	85 c0                	test   %eax,%eax
  40104f:	75 07                	jne    401058 <phase_4+0x4c>
  401051:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401056:	74 05                	je     40105d <phase_4+0x51>
  401058:	e8 dd 03 00 00       	call   40143a <explode_bomb>
  40105d:	48 83 c4 18          	add    $0x18,%rsp
  401061:	c3                   	ret    

0000000000401062 <phase_5>:
  401062:	53                   	push   %rbx
  401063:	48 83 ec 20          	sub    $0x20,%rsp
  401067:	48 89 fb             	mov    %rdi,%rbx
  40106a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401071:	00 00 
  401073:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401078:	31 c0                	xor    %eax,%eax
  40107a:	e8 9c 02 00 00       	call   40131b <string_length>
  40107f:	83 f8 06             	cmp    $0x6,%eax
  401082:	74 4e                	je     4010d2 <phase_5+0x70>
  401084:	e8 b1 03 00 00       	call   40143a <explode_bomb>
  401089:	eb 47                	jmp    4010d2 <phase_5+0x70>
  40108b:	0f b6 0c 03          	movzbl (%rbx,%rax,1),%ecx
  40108f:	88 0c 24             	mov    %cl,(%rsp)
  401092:	48 8b 14 24          	mov    (%rsp),%rdx
  401096:	83 e2 0f             	and    $0xf,%edx
  401099:	0f b6 92 b0 24 40 00 	movzbl 0x4024b0(%rdx),%edx
  4010a0:	88 54 04 10          	mov    %dl,0x10(%rsp,%rax,1)
  4010a4:	48 83 c0 01          	add    $0x1,%rax
  4010a8:	48 83 f8 06          	cmp    $0x6,%rax
  4010ac:	75 dd                	jne    40108b <phase_5+0x29>
  4010ae:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
  4010b3:	be 5e 24 40 00       	mov    $0x40245e,%esi
  4010b8:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4010bd:	e8 76 02 00 00       	call   401338 <strings_not_equal>
  4010c2:	85 c0                	test   %eax,%eax
  4010c4:	74 13                	je     4010d9 <phase_5+0x77>
  4010c6:	e8 6f 03 00 00       	call   40143a <explode_bomb>
  4010cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4010d0:	eb 07                	jmp    4010d9 <phase_5+0x77>
  4010d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4010d7:	eb b2                	jmp    40108b <phase_5+0x29>
  4010d9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4010de:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4010e5:	00 00 
  4010e7:	74 05                	je     4010ee <phase_5+0x8c>
  4010e9:	e8 42 fa ff ff       	call   400b30 <__stack_chk_fail@plt>
  4010ee:	48 83 c4 20          	add    $0x20,%rsp
  4010f2:	5b                   	pop    %rbx
  4010f3:	c3                   	ret    

00000000004010f4 <phase_6>:
  4010f4:	41 56                	push   %r14
  4010f6:	41 55                	push   %r13
  4010f8:	41 54                	push   %r12
  4010fa:	55                   	push   %rbp
  4010fb:	53                   	push   %rbx
  4010fc:	48 83 ec 50          	sub    $0x50,%rsp
  401100:	49 89 e5             	mov    %rsp,%r13
  401103:	48 89 e6             	mov    %rsp,%rsi
  401106:	e8 51 03 00 00       	call   40145c <read_six_numbers>
  40110b:	49 89 e6             	mov    %rsp,%r14
  40110e:	41 bc 00 00 00 00    	mov    $0x0,%r12d
  401114:	4c 89 ed             	mov    %r13,%rbp
  401117:	41 8b 45 00          	mov    0x0(%r13),%eax
  40111b:	83 e8 01             	sub    $0x1,%eax
  40111e:	83 f8 05             	cmp    $0x5,%eax
  401121:	76 05                	jbe    401128 <phase_6+0x34>
  401123:	e8 12 03 00 00       	call   40143a <explode_bomb>
  401128:	41 83 c4 01          	add    $0x1,%r12d
  40112c:	41 83 fc 06          	cmp    $0x6,%r12d
  401130:	74 21                	je     401153 <phase_6+0x5f>
  401132:	44 89 e3             	mov    %r12d,%ebx
  401135:	48 63 c3             	movslq %ebx,%rax
  401138:	8b 04 84             	mov    (%rsp,%rax,4),%eax
  40113b:	39 45 00             	cmp    %eax,0x0(%rbp)
  40113e:	75 05                	jne    401145 <phase_6+0x51>
  401140:	e8 f5 02 00 00       	call   40143a <explode_bomb>
  401145:	83 c3 01             	add    $0x1,%ebx
  401148:	83 fb 05             	cmp    $0x5,%ebx
  40114b:	7e e8                	jle    401135 <phase_6+0x41>
  40114d:	49 83 c5 04          	add    $0x4,%r13
  401151:	eb c1                	jmp    401114 <phase_6+0x20>
  401153:	48 8d 74 24 18       	lea    0x18(%rsp),%rsi
  401158:	4c 89 f0             	mov    %r14,%rax
  40115b:	b9 07 00 00 00       	mov    $0x7,%ecx
  401160:	89 ca                	mov    %ecx,%edx
  401162:	2b 10                	sub    (%rax),%edx
  401164:	89 10                	mov    %edx,(%rax)
  401166:	48 83 c0 04          	add    $0x4,%rax
  40116a:	48 39 f0             	cmp    %rsi,%rax
  40116d:	75 f1                	jne    401160 <phase_6+0x6c>
  40116f:	be 00 00 00 00       	mov    $0x0,%esi
  401174:	eb 21                	jmp    401197 <phase_6+0xa3>
  401176:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  40117a:	83 c0 01             	add    $0x1,%eax
  40117d:	39 c8                	cmp    %ecx,%eax
  40117f:	75 f5                	jne    401176 <phase_6+0x82>
  401181:	eb 05                	jmp    401188 <phase_6+0x94>
  401183:	ba d0 32 60 00       	mov    $0x6032d0,%edx
  401188:	48 89 54 74 20       	mov    %rdx,0x20(%rsp,%rsi,2)
  40118d:	48 83 c6 04          	add    $0x4,%rsi
  401191:	48 83 fe 18          	cmp    $0x18,%rsi
  401195:	74 14                	je     4011ab <phase_6+0xb7>
  401197:	8b 0c 34             	mov    (%rsp,%rsi,1),%ecx
  40119a:	83 f9 01             	cmp    $0x1,%ecx
  40119d:	7e e4                	jle    401183 <phase_6+0x8f>
  40119f:	b8 01 00 00 00       	mov    $0x1,%eax
  4011a4:	ba d0 32 60 00       	mov    $0x6032d0,%edx
  4011a9:	eb cb                	jmp    401176 <phase_6+0x82>
  4011ab:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  4011b0:	48 8d 44 24 28       	lea    0x28(%rsp),%rax
  4011b5:	48 8d 74 24 50       	lea    0x50(%rsp),%rsi
  4011ba:	48 89 d9             	mov    %rbx,%rcx
  4011bd:	48 8b 10             	mov    (%rax),%rdx
  4011c0:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  4011c4:	48 83 c0 08          	add    $0x8,%rax
  4011c8:	48 39 f0             	cmp    %rsi,%rax
  4011cb:	74 05                	je     4011d2 <phase_6+0xde>
  4011cd:	48 89 d1             	mov    %rdx,%rcx
  4011d0:	eb eb                	jmp    4011bd <phase_6+0xc9>
  4011d2:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  4011d9:	00 
  4011da:	bd 05 00 00 00       	mov    $0x5,%ebp
  4011df:	48 8b 43 08          	mov    0x8(%rbx),%rax
  4011e3:	8b 00                	mov    (%rax),%eax
  4011e5:	39 03                	cmp    %eax,(%rbx)
  4011e7:	7d 05                	jge    4011ee <phase_6+0xfa>
  4011e9:	e8 4c 02 00 00       	call   40143a <explode_bomb>
  4011ee:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  4011f2:	83 ed 01             	sub    $0x1,%ebp
  4011f5:	75 e8                	jne    4011df <phase_6+0xeb>
  4011f7:	48 83 c4 50          	add    $0x50,%rsp
  4011fb:	5b                   	pop    %rbx
  4011fc:	5d                   	pop    %rbp
  4011fd:	41 5c                	pop    %r12
  4011ff:	41 5d                	pop    %r13
  401201:	41 5e                	pop    %r14
  401203:	c3                   	ret    

0000000000401204 <fun7>:
  401204:	48 83 ec 08          	sub    $0x8,%rsp
  401208:	48 85 ff             	test   %rdi,%rdi
  40120b:	74 2b                	je     401238 <fun7+0x34>
  40120d:	8b 17                	mov    (%rdi),%edx
  40120f:	39 f2                	cmp    %esi,%edx
  401211:	7e 0d                	jle    401220 <fun7+0x1c>
  401213:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  401217:	e8 e8 ff ff ff       	call   401204 <fun7>
  40121c:	01 c0                	add    %eax,%eax
  40121e:	eb 1d                	jmp    40123d <fun7+0x39>
  401220:	b8 00 00 00 00       	mov    $0x0,%eax
  401225:	39 f2                	cmp    %esi,%edx
  401227:	74 14                	je     40123d <fun7+0x39>
  401229:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  40122d:	e8 d2 ff ff ff       	call   401204 <fun7>
  401232:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  401236:	eb 05                	jmp    40123d <fun7+0x39>
  401238:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40123d:	48 83 c4 08          	add    $0x8,%rsp
  401241:	c3                   	ret    

0000000000401242 <secret_phase>:
  401242:	53                   	push   %rbx
  401243:	e8 56 02 00 00       	call   40149e <read_line>
  401248:	ba 0a 00 00 00       	mov    $0xa,%edx
  40124d:	be 00 00 00 00       	mov    $0x0,%esi
  401252:	48 89 c7             	mov    %rax,%rdi
  401255:	e8 76 f9 ff ff       	call   400bd0 <strtol@plt>
  40125a:	48 89 c3             	mov    %rax,%rbx
  40125d:	8d 40 ff             	lea    -0x1(%rax),%eax
  401260:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  401265:	76 05                	jbe    40126c <secret_phase+0x2a>
  401267:	e8 ce 01 00 00       	call   40143a <explode_bomb>
  40126c:	89 de                	mov    %ebx,%esi
  40126e:	bf f0 30 60 00       	mov    $0x6030f0,%edi
  401273:	e8 8c ff ff ff       	call   401204 <fun7>
  401278:	83 f8 02             	cmp    $0x2,%eax
  40127b:	74 05                	je     401282 <secret_phase+0x40>
  40127d:	e8 b8 01 00 00       	call   40143a <explode_bomb>
  401282:	bf 38 24 40 00       	mov    $0x402438,%edi
  401287:	e8 84 f8 ff ff       	call   400b10 <puts@plt>
  40128c:	e8 33 03 00 00       	call   4015c4 <phase_defused>
  401291:	5b                   	pop    %rbx
  401292:	c3                   	ret    
  401293:	90                   	nop
  401294:	90                   	nop
  401295:	90                   	nop
  401296:	90                   	nop
  401297:	90                   	nop
  401298:	90                   	nop
  401299:	90                   	nop
  40129a:	90                   	nop
  40129b:	90                   	nop
  40129c:	90                   	nop
  40129d:	90                   	nop
  40129e:	90                   	nop
  40129f:	90                   	nop

00000000004012a0 <sig_handler>:
  4012a0:	48 83 ec 08          	sub    $0x8,%rsp
  4012a4:	bf c0 24 40 00       	mov    $0x4024c0,%edi
  4012a9:	e8 62 f8 ff ff       	call   400b10 <puts@plt>
  4012ae:	bf 03 00 00 00       	mov    $0x3,%edi
  4012b3:	e8 98 f9 ff ff       	call   400c50 <sleep@plt>
  4012b8:	be 82 25 40 00       	mov    $0x402582,%esi
  4012bd:	bf 01 00 00 00       	mov    $0x1,%edi
  4012c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4012c7:	e8 34 f9 ff ff       	call   400c00 <__printf_chk@plt>
  4012cc:	48 8b 3d 6d 24 20 00 	mov    0x20246d(%rip),%rdi        # 603740 <stdout@GLIBC_2.2.5>
  4012d3:	e8 08 f9 ff ff       	call   400be0 <fflush@plt>
  4012d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4012dd:	e8 6e f9 ff ff       	call   400c50 <sleep@plt>
  4012e2:	bf 8a 25 40 00       	mov    $0x40258a,%edi
  4012e7:	e8 24 f8 ff ff       	call   400b10 <puts@plt>
  4012ec:	bf 10 00 00 00       	mov    $0x10,%edi
  4012f1:	e8 2a f9 ff ff       	call   400c20 <exit@plt>

00000000004012f6 <invalid_phase>:
  4012f6:	48 83 ec 08          	sub    $0x8,%rsp
  4012fa:	48 89 fa             	mov    %rdi,%rdx
  4012fd:	be 92 25 40 00       	mov    $0x402592,%esi
  401302:	bf 01 00 00 00       	mov    $0x1,%edi
  401307:	b8 00 00 00 00       	mov    $0x0,%eax
  40130c:	e8 ef f8 ff ff       	call   400c00 <__printf_chk@plt>
  401311:	bf 08 00 00 00       	mov    $0x8,%edi
  401316:	e8 05 f9 ff ff       	call   400c20 <exit@plt>

000000000040131b <string_length>: # return len of ptr of %rdi in a %rax

0000000000401338 <strings_not_equal>: # return 1 if str in %rdi and %rsi equal 0 otherwise in %rax

00000000004013a2 <initialize_bomb>: # ~

00000000004013ba <initialize_bomb_solve>: # ~

00000000004013bc <blank_line>: # ret 1 if [space] or empty line, 0 otherwise.

00000000004013f9 <skip>:
  4013f9:	53                   	push   %rbx
  4013fa:	48 63 05 5f 23 20 00 	movslq 0x20235f(%rip),%rax        # 603760 <num_input_strings>
  401401:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  401405:	48 c1 e7 04          	shl    $0x4,%rdi
  401409:	48 81 c7 80 37 60 00 	add    $0x603780,%rdi
  401410:	48 8b 15 51 23 20 00 	mov    0x202351(%rip),%rdx        # 603768 <infile>
  401417:	be 50 00 00 00       	mov    $0x50,%esi
  40141c:	e8 5f f7 ff ff       	call   400b80 <fgets@plt>
  401421:	48 89 c3             	mov    %rax,%rbx
  401424:	48 85 c0             	test   %rax,%rax
  401427:	74 0c                	je     401435 <skip+0x3c>
  401429:	48 89 c7             	mov    %rax,%rdi
  40142c:	e8 8b ff ff ff       	call   4013bc <blank_line>
  401431:	85 c0                	test   %eax,%eax
  401433:	75 c5                	jne    4013fa <skip+0x1>
  401435:	48 89 d8             	mov    %rbx,%rax
  401438:	5b                   	pop    %rbx
  401439:	c3                   	ret    

000000000040143a <explode_bomb>: # show text and exit 

000000000040145c <read_six_numbers>:
  40145c:	48 83 ec 18          	sub    $0x18,%rsp
  401460:	48 89 f2             	mov    %rsi,%rdx
  401463:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401467:	48 8d 46 14          	lea    0x14(%rsi),%rax
  40146b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401470:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401474:	48 89 04 24          	mov    %rax,(%rsp)
  401478:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  40147c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401480:	be c3 25 40 00       	mov    $0x4025c3,%esi
  401485:	b8 00 00 00 00       	mov    $0x0,%eax
  40148a:	e8 61 f7 ff ff       	call   400bf0 <__isoc99_sscanf@plt>
  40148f:	83 f8 05             	cmp    $0x5,%eax
  401492:	7f 05                	jg     401499 <read_six_numbers+0x3d>
  401494:	e8 a1 ff ff ff       	call   40143a <explode_bomb>
  401499:	48 83 c4 18          	add    $0x18,%rsp
  40149d:	c3                   	ret    

000000000040149e <read_line>:
  40149e:	48 83 ec 08          	sub    $0x8,%rsp
  4014a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4014a7:	e8 4d ff ff ff       	call   4013f9 <skip>
  4014ac:	48 85 c0             	test   %rax,%rax
  4014af:	75 6e                	jne    40151f <read_line+0x81>
  4014b1:	48 8b 05 90 22 20 00 	mov    0x202290(%rip),%rax        # 603748 <stdin@GLIBC_2.2.5>
  4014b8:	48 39 05 a9 22 20 00 	cmp    %rax,0x2022a9(%rip)        # 603768 <infile>
  4014bf:	75 14                	jne    4014d5 <read_line+0x37>
  4014c1:	bf d5 25 40 00       	mov    $0x4025d5,%edi
  4014c6:	e8 45 f6 ff ff       	call   400b10 <puts@plt>
  4014cb:	bf 08 00 00 00       	mov    $0x8,%edi
  4014d0:	e8 4b f7 ff ff       	call   400c20 <exit@plt>
  4014d5:	bf f3 25 40 00       	mov    $0x4025f3,%edi
  4014da:	e8 01 f6 ff ff       	call   400ae0 <getenv@plt>
  4014df:	48 85 c0             	test   %rax,%rax
  4014e2:	74 0a                	je     4014ee <read_line+0x50>
  4014e4:	bf 00 00 00 00       	mov    $0x0,%edi
  4014e9:	e8 32 f7 ff ff       	call   400c20 <exit@plt>
  4014ee:	48 8b 05 53 22 20 00 	mov    0x202253(%rip),%rax        # 603748 <stdin@GLIBC_2.2.5>
  4014f5:	48 89 05 6c 22 20 00 	mov    %rax,0x20226c(%rip)        # 603768 <infile>
  4014fc:	b8 00 00 00 00       	mov    $0x0,%eax
  401501:	e8 f3 fe ff ff       	call   4013f9 <skip>
  401506:	48 85 c0             	test   %rax,%rax
  401509:	75 14                	jne    40151f <read_line+0x81>
  40150b:	bf d5 25 40 00       	mov    $0x4025d5,%edi
  401510:	e8 fb f5 ff ff       	call   400b10 <puts@plt>
  401515:	bf 00 00 00 00       	mov    $0x0,%edi
  40151a:	e8 01 f7 ff ff       	call   400c20 <exit@plt>
  40151f:	8b 15 3b 22 20 00    	mov    0x20223b(%rip),%edx        # 603760 <num_input_strings>
  401525:	48 63 c2             	movslq %edx,%rax
  401528:	48 8d 34 80          	lea    (%rax,%rax,4),%rsi
  40152c:	48 c1 e6 04          	shl    $0x4,%rsi
  401530:	48 81 c6 80 37 60 00 	add    $0x603780,%rsi
  401537:	48 89 f7             	mov    %rsi,%rdi
  40153a:	b8 00 00 00 00       	mov    $0x0,%eax
  40153f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401546:	f2 ae                	repnz scas %es:(%rdi),%al
  401548:	48 f7 d1             	not    %rcx
  40154b:	48 83 e9 01          	sub    $0x1,%rcx
  40154f:	83 f9 4e             	cmp    $0x4e,%ecx
  401552:	7e 46                	jle    40159a <read_line+0xfc>
  401554:	bf fe 25 40 00       	mov    $0x4025fe,%edi
  401559:	e8 b2 f5 ff ff       	call   400b10 <puts@plt>
  40155e:	8b 05 fc 21 20 00    	mov    0x2021fc(%rip),%eax        # 603760 <num_input_strings>
  401564:	8d 50 01             	lea    0x1(%rax),%edx
  401567:	89 15 f3 21 20 00    	mov    %edx,0x2021f3(%rip)        # 603760 <num_input_strings>
  40156d:	48 98                	cltq   
  40156f:	48 6b c0 50          	imul   $0x50,%rax,%rax
  401573:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
  40157a:	75 6e 63 
  40157d:	48 89 b8 80 37 60 00 	mov    %rdi,0x603780(%rax)
  401584:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
  40158b:	2a 2a 00 
  40158e:	48 89 b8 88 37 60 00 	mov    %rdi,0x603788(%rax)
  401595:	e8 a0 fe ff ff       	call   40143a <explode_bomb>
  40159a:	83 e9 01             	sub    $0x1,%ecx
  40159d:	48 63 c9             	movslq %ecx,%rcx
  4015a0:	48 63 c2             	movslq %edx,%rax
  4015a3:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015a7:	48 c1 e0 04          	shl    $0x4,%rax
  4015ab:	c6 84 01 80 37 60 00 	movb   $0x0,0x603780(%rcx,%rax,1)
  4015b2:	00 
  4015b3:	83 c2 01             	add    $0x1,%edx
  4015b6:	89 15 a4 21 20 00    	mov    %edx,0x2021a4(%rip)        # 603760 <num_input_strings>
  4015bc:	48 89 f0             	mov    %rsi,%rax
  4015bf:	48 83 c4 08          	add    $0x8,%rsp
  4015c3:	c3                   	ret    

00000000004015c4 <phase_defused>:
  4015c4:	48 83 ec 78          	sub    $0x78,%rsp
  4015c8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4015cf:	00 00 
  4015d1:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  4015d6:	31 c0                	xor    %eax,%eax
  4015d8:	83 3d 81 21 20 00 06 	cmpl   $0x6,0x202181(%rip)        # 603760 <num_input_strings>
  4015df:	75 5e                	jne    40163f <phase_defused+0x7b>
  4015e1:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4015e6:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  4015eb:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  4015f0:	be 19 26 40 00       	mov    $0x402619,%esi
  4015f5:	bf 70 38 60 00       	mov    $0x603870,%edi
  4015fa:	e8 f1 f5 ff ff       	call   400bf0 <__isoc99_sscanf@plt>
  4015ff:	83 f8 03             	cmp    $0x3,%eax
  401602:	75 31                	jne    401635 <phase_defused+0x71>
  401604:	be 22 26 40 00       	mov    $0x402622,%esi
  401609:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40160e:	e8 25 fd ff ff       	call   401338 <strings_not_equal>
  401613:	85 c0                	test   %eax,%eax
  401615:	75 1e                	jne    401635 <phase_defused+0x71>
  401617:	bf f8 24 40 00       	mov    $0x4024f8,%edi
  40161c:	e8 ef f4 ff ff       	call   400b10 <puts@plt>
  401621:	bf 20 25 40 00       	mov    $0x402520,%edi
  401626:	e8 e5 f4 ff ff       	call   400b10 <puts@plt>
  40162b:	b8 00 00 00 00       	mov    $0x0,%eax
  401630:	e8 0d fc ff ff       	call   401242 <secret_phase>
  401635:	bf 58 25 40 00       	mov    $0x402558,%edi
  40163a:	e8 d1 f4 ff ff       	call   400b10 <puts@plt>
  40163f:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  401644:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40164b:	00 00 
  40164d:	74 05                	je     401654 <phase_defused+0x90>
  40164f:	e8 dc f4 ff ff       	call   400b30 <__stack_chk_fail@plt>
  401654:	48 83 c4 78          	add    $0x78,%rsp
  401658:	c3                   	ret    
  401659:	90                   	nop
  40165a:	90                   	nop
  40165b:	90                   	nop
  40165c:	90                   	nop
  40165d:	90                   	nop
  40165e:	90                   	nop
  40165f:	90                   	nop

0000000000401660 <sigalrm_handler>:
  401660:	48 83 ec 08          	sub    $0x8,%rsp
  401664:	b9 00 00 00 00       	mov    $0x0,%ecx
  401669:	ba 78 26 40 00       	mov    $0x402678,%edx
  40166e:	be 01 00 00 00       	mov    $0x1,%esi
  401673:	48 8b 3d d6 20 20 00 	mov    0x2020d6(%rip),%rdi        # 603750 <stderr@GLIBC_2.2.5>
  40167a:	b8 00 00 00 00       	mov    $0x0,%eax
  40167f:	e8 bc f5 ff ff       	call   400c40 <__fprintf_chk@plt>
  401684:	bf 01 00 00 00       	mov    $0x1,%edi
  401689:	e8 92 f5 ff ff       	call   400c20 <exit@plt>

000000000040168e <rio_readlineb>:
  40168e:	41 57                	push   %r15
  401690:	41 56                	push   %r14
  401692:	41 55                	push   %r13
  401694:	41 54                	push   %r12
  401696:	55                   	push   %rbp
  401697:	53                   	push   %rbx
  401698:	48 83 ec 38          	sub    $0x38,%rsp
  40169c:	49 89 f6             	mov    %rsi,%r14
  40169f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  4016a4:	48 83 fa 01          	cmp    $0x1,%rdx
  4016a8:	0f 86 c9 00 00 00    	jbe    401777 <rio_readlineb+0xe9>
  4016ae:	48 89 fb             	mov    %rdi,%rbx
  4016b1:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  4016b7:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4016bb:	eb 30                	jmp    4016ed <rio_readlineb+0x5f>
  4016bd:	ba 00 20 00 00       	mov    $0x2000,%edx
  4016c2:	4c 89 e6             	mov    %r12,%rsi
  4016c5:	8b 3b                	mov    (%rbx),%edi
  4016c7:	e8 94 f4 ff ff       	call   400b60 <read@plt>
  4016cc:	89 43 04             	mov    %eax,0x4(%rbx)
  4016cf:	85 c0                	test   %eax,%eax
  4016d1:	79 12                	jns    4016e5 <rio_readlineb+0x57>
  4016d3:	e8 18 f4 ff ff       	call   400af0 <__errno_location@plt>
  4016d8:	83 38 04             	cmpl   $0x4,(%rax)
  4016db:	74 10                	je     4016ed <rio_readlineb+0x5f>
  4016dd:	0f 1f 00             	nopl   (%rax)
  4016e0:	e9 a1 00 00 00       	jmp    401786 <rio_readlineb+0xf8>
  4016e5:	85 c0                	test   %eax,%eax
  4016e7:	74 71                	je     40175a <rio_readlineb+0xcc>
  4016e9:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4016ed:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4016f0:	85 ed                	test   %ebp,%ebp
  4016f2:	7e c9                	jle    4016bd <rio_readlineb+0x2f>
  4016f4:	85 ed                	test   %ebp,%ebp
  4016f6:	41 0f 95 c7          	setne  %r15b
  4016fa:	41 0f b6 c7          	movzbl %r15b,%eax
  4016fe:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401702:	45 0f b6 ff          	movzbl %r15b,%r15d
  401706:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  40170a:	48 89 ce             	mov    %rcx,%rsi
  40170d:	b9 01 00 00 00       	mov    $0x1,%ecx
  401712:	4c 89 fa             	mov    %r15,%rdx
  401715:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
  40171a:	48 8d 7c 24 2f       	lea    0x2f(%rsp),%rdi
  40171f:	e8 9c f4 ff ff       	call   400bc0 <__memcpy_chk@plt>
  401724:	4c 03 7c 24 10       	add    0x10(%rsp),%r15
  401729:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
  40172d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401731:	29 c5                	sub    %eax,%ebp
  401733:	89 6b 04             	mov    %ebp,0x4(%rbx)
  401736:	83 f8 01             	cmp    $0x1,%eax
  401739:	75 13                	jne    40174e <rio_readlineb+0xc0>
  40173b:	49 83 c6 01          	add    $0x1,%r14
  40173f:	0f b6 44 24 2f       	movzbl 0x2f(%rsp),%eax
  401744:	41 88 46 ff          	mov    %al,-0x1(%r14)
  401748:	3c 0a                	cmp    $0xa,%al
  40174a:	75 18                	jne    401764 <rio_readlineb+0xd6>
  40174c:	eb 2f                	jmp    40177d <rio_readlineb+0xef>
  40174e:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401753:	75 3a                	jne    40178f <rio_readlineb+0x101>
  401755:	44 89 e8             	mov    %r13d,%eax
  401758:	eb 03                	jmp    40175d <rio_readlineb+0xcf>
  40175a:	44 89 e8             	mov    %r13d,%eax
  40175d:	83 f8 01             	cmp    $0x1,%eax
  401760:	75 1b                	jne    40177d <rio_readlineb+0xef>
  401762:	eb 34                	jmp    401798 <rio_readlineb+0x10a>
  401764:	41 83 c5 01          	add    $0x1,%r13d
  401768:	49 63 c5             	movslq %r13d,%rax
  40176b:	48 3b 44 24 18       	cmp    0x18(%rsp),%rax
  401770:	73 0b                	jae    40177d <rio_readlineb+0xef>
  401772:	e9 76 ff ff ff       	jmp    4016ed <rio_readlineb+0x5f>
  401777:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  40177d:	41 c6 06 00          	movb   $0x0,(%r14)
  401781:	49 63 c5             	movslq %r13d,%rax
  401784:	eb 17                	jmp    40179d <rio_readlineb+0x10f>
  401786:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40178d:	eb 0e                	jmp    40179d <rio_readlineb+0x10f>
  40178f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401796:	eb 05                	jmp    40179d <rio_readlineb+0x10f>
  401798:	b8 00 00 00 00       	mov    $0x0,%eax
  40179d:	48 83 c4 38          	add    $0x38,%rsp
  4017a1:	5b                   	pop    %rbx
  4017a2:	5d                   	pop    %rbp
  4017a3:	41 5c                	pop    %r12
  4017a5:	41 5d                	pop    %r13
  4017a7:	41 5e                	pop    %r14
  4017a9:	41 5f                	pop    %r15
  4017ab:	c3                   	ret    

0000000000401f91 <init_timeout>:
  401f91:	53                   	push   %rbx
  401f92:	89 fb                	mov    %edi,%ebx
  401f94:	85 ff                	test   %edi,%edi
  401f96:	74 1e                	je     401fb6 <init_timeout+0x25>
  401f98:	be 60 16 40 00       	mov    $0x401660,%esi
  401f9d:	bf 0e 00 00 00       	mov    $0xe,%edi
  401fa2:	e8 e9 eb ff ff       	call   400b90 <signal@plt>
  401fa7:	85 db                	test   %ebx,%ebx
  401fa9:	bf 00 00 00 00       	mov    $0x0,%edi
  401fae:	0f 49 fb             	cmovns %ebx,%edi
  401fb1:	e8 8a eb ff ff       	call   400b40 <alarm@plt>
  401fb6:	5b                   	pop    %rbx
  401fb7:	c3                   	ret    

0000000000401fb8 <init_driver>:
  401fb8:	55                   	push   %rbp
  401fb9:	53                   	push   %rbx
  401fba:	48 83 ec 28          	sub    $0x28,%rsp
  401fbe:	48 89 fd             	mov    %rdi,%rbp
  401fc1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401fc8:	00 00 
  401fca:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401fcf:	31 c0                	xor    %eax,%eax
  401fd1:	be 01 00 00 00       	mov    $0x1,%esi
  401fd6:	bf 0d 00 00 00       	mov    $0xd,%edi
  401fdb:	e8 b0 eb ff ff       	call   400b90 <signal@plt>
  401fe0:	be 01 00 00 00       	mov    $0x1,%esi
  401fe5:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401fea:	e8 a1 eb ff ff       	call   400b90 <signal@plt>
  401fef:	be 01 00 00 00       	mov    $0x1,%esi
  401ff4:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401ff9:	e8 92 eb ff ff       	call   400b90 <signal@plt>
  401ffe:	ba 00 00 00 00       	mov    $0x0,%edx
  402003:	be 01 00 00 00       	mov    $0x1,%esi
  402008:	bf 02 00 00 00       	mov    $0x2,%edi
  40200d:	e8 6e ec ff ff       	call   400c80 <socket@plt>
  402012:	89 c3                	mov    %eax,%ebx
  402014:	85 c0                	test   %eax,%eax
  402016:	79 4f                	jns    402067 <init_driver+0xaf>
  402018:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40201f:	3a 20 43 
  402022:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402026:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40202d:	20 75 6e 
  402030:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402034:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40203b:	74 6f 20 
  40203e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402042:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402049:	65 20 73 
  40204c:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402050:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402057:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40205d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402062:	e9 0a 01 00 00       	jmp    402171 <init_driver+0x1b9>
  402067:	bf 60 27 40 00       	mov    $0x402760,%edi
  40206c:	e8 2f eb ff ff       	call   400ba0 <gethostbyname@plt>
  402071:	48 85 c0             	test   %rax,%rax
  402074:	75 68                	jne    4020de <init_driver+0x126>
  402076:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40207d:	3a 20 44 
  402080:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402084:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  40208b:	20 75 6e 
  40208e:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402092:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402099:	74 6f 20 
  40209c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4020a0:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4020a7:	76 65 20 
  4020aa:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4020ae:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4020b5:	72 20 61 
  4020b8:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4020bc:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4020c3:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4020c9:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4020cd:	89 df                	mov    %ebx,%edi
  4020cf:	e8 7c ea ff ff       	call   400b50 <close@plt>
  4020d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020d9:	e9 93 00 00 00       	jmp    402171 <init_driver+0x1b9>
  4020de:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4020e5:	00 
  4020e6:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4020ed:	00 00 
  4020ef:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4020f5:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4020f9:	48 8b 40 18          	mov    0x18(%rax),%rax
  4020fd:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402102:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402107:	48 8b 30             	mov    (%rax),%rsi
  40210a:	e8 a1 ea ff ff       	call   400bb0 <__memmove_chk@plt>
  40210f:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  402116:	ba 10 00 00 00       	mov    $0x10,%edx
  40211b:	48 89 e6             	mov    %rsp,%rsi
  40211e:	89 df                	mov    %ebx,%edi
  402120:	e8 0b eb ff ff       	call   400c30 <connect@plt>
  402125:	85 c0                	test   %eax,%eax
  402127:	79 32                	jns    40215b <init_driver+0x1a3>
  402129:	41 b8 60 27 40 00    	mov    $0x402760,%r8d
  40212f:	b9 20 27 40 00       	mov    $0x402720,%ecx
  402134:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40213b:	be 01 00 00 00       	mov    $0x1,%esi
  402140:	48 89 ef             	mov    %rbp,%rdi
  402143:	b8 00 00 00 00       	mov    $0x0,%eax
  402148:	e8 23 eb ff ff       	call   400c70 <__sprintf_chk@plt>
  40214d:	89 df                	mov    %ebx,%edi
  40214f:	e8 fc e9 ff ff       	call   400b50 <close@plt>
  402154:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402159:	eb 16                	jmp    402171 <init_driver+0x1b9>
  40215b:	89 df                	mov    %ebx,%edi
  40215d:	e8 ee e9 ff ff       	call   400b50 <close@plt>
  402162:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402168:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  40216c:	b8 00 00 00 00       	mov    $0x0,%eax
  402171:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402176:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40217d:	00 00 
  40217f:	74 05                	je     402186 <init_driver+0x1ce>
  402181:	e8 aa e9 ff ff       	call   400b30 <__stack_chk_fail@plt>
  402186:	48 83 c4 28          	add    $0x28,%rsp
  40218a:	5b                   	pop    %rbx
  40218b:	5d                   	pop    %rbp
  40218c:	c3                   	ret    

000000000040218d <driver_post>:
  40218d:	53                   	push   %rbx
  40218e:	48 83 ec 10          	sub    $0x10,%rsp
  402192:	48 89 cb             	mov    %rcx,%rbx
  402195:	85 d2                	test   %edx,%edx
  402197:	74 27                	je     4021c0 <driver_post+0x33>
  402199:	48 89 f2             	mov    %rsi,%rdx
  40219c:	be 78 27 40 00       	mov    $0x402778,%esi
  4021a1:	bf 01 00 00 00       	mov    $0x1,%edi
  4021a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ab:	e8 50 ea ff ff       	call   400c00 <__printf_chk@plt>
  4021b0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4021b5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4021b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4021be:	eb 3e                	jmp    4021fe <driver_post+0x71>
  4021c0:	48 85 ff             	test   %rdi,%rdi
  4021c3:	74 2b                	je     4021f0 <driver_post+0x63>
  4021c5:	80 3f 00             	cmpb   $0x0,(%rdi)
  4021c8:	74 26                	je     4021f0 <driver_post+0x63>
  4021ca:	48 89 0c 24          	mov    %rcx,(%rsp)
  4021ce:	49 89 f1             	mov    %rsi,%r9
  4021d1:	41 b8 ec 22 40 00    	mov    $0x4022ec,%r8d
  4021d7:	48 89 f9             	mov    %rdi,%rcx
  4021da:	ba 8f 27 40 00       	mov    $0x40278f,%edx
  4021df:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  4021e4:	bf 60 27 40 00       	mov    $0x402760,%edi
  4021e9:	e8 be f5 ff ff       	call   4017ac <submitr>
  4021ee:	eb 0e                	jmp    4021fe <driver_post+0x71>
  4021f0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4021f5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4021f9:	b8 00 00 00 00       	mov    $0x0,%eax
  4021fe:	48 83 c4 10          	add    $0x10,%rsp
  402202:	5b                   	pop    %rbx
  402203:	c3                   	ret    
  402204:	90                   	nop
  402205:	90                   	nop
  402206:	90                   	nop
  402207:	90                   	nop
  402208:	90                   	nop
  402209:	90                   	nop
  40220a:	90                   	nop
  40220b:	90                   	nop
  40220c:	90                   	nop
  40220d:	90                   	nop
  40220e:	90                   	nop
  40220f:	90                   	nop

0000000000402210 <__libc_csu_init>:
  402210:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402215:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40221a:	48 8d 2d df 0b 20 00 	lea    0x200bdf(%rip),%rbp        # 602e00 <__do_global_dtors_aux_fini_array_entry>
  402221:	4c 8d 25 d0 0b 20 00 	lea    0x200bd0(%rip),%r12        # 602df8 <__frame_dummy_init_array_entry>
  402228:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40222d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402232:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402237:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40223c:	48 83 ec 38          	sub    $0x38,%rsp
  402240:	4c 29 e5             	sub    %r12,%rbp
  402243:	41 89 fd             	mov    %edi,%r13d
  402246:	49 89 f6             	mov    %rsi,%r14
  402249:	48 c1 fd 03          	sar    $0x3,%rbp
  40224d:	49 89 d7             	mov    %rdx,%r15
  402250:	e8 6b e8 ff ff       	call   400ac0 <_init>
  402255:	48 85 ed             	test   %rbp,%rbp
  402258:	74 1c                	je     402276 <__libc_csu_init+0x66>
  40225a:	31 db                	xor    %ebx,%ebx
  40225c:	0f 1f 40 00          	nopl   0x0(%rax)
  402260:	4c 89 fa             	mov    %r15,%rdx
  402263:	4c 89 f6             	mov    %r14,%rsi
  402266:	44 89 ef             	mov    %r13d,%edi
  402269:	41 ff 14 dc          	call   *(%r12,%rbx,8)
  40226d:	48 83 c3 01          	add    $0x1,%rbx
  402271:	48 39 eb             	cmp    %rbp,%rbx
  402274:	75 ea                	jne    402260 <__libc_csu_init+0x50>
  402276:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40227b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402280:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402285:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40228a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40228f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402294:	48 83 c4 38          	add    $0x38,%rsp
  402298:	c3                   	ret    
  402299:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004022a0 <__libc_csu_fini>:
  4022a0:	f3 c3                	repz ret 
  4022a2:	90                   	nop
  4022a3:	90                   	nop

Disassembly of section .fini:

00000000004022a4 <_fini>:
  4022a4:	48 83 ec 08          	sub    $0x8,%rsp
  4022a8:	48 83 c4 08          	add    $0x8,%rsp
  4022ac:	c3                   	ret    
