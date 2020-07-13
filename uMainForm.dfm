object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'Tablograph'
  ClientHeight = 572
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object ToolPanel: TPanel
    Left = 0
    Top = 0
    Width = 706
    Height = 33
    Align = alTop
    TabOrder = 0
    object BtnTileWindows: TSpeedButton
      Left = 369
      Top = 1
      Width = 72
      Height = 31
      Align = alLeft
      Caption = 'All'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B00000000000000000000D8E9ECD8E9EC
        D8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9ECD8E9
        ECD8E9ECD8E9ECD8E9ECD8E9EC218CC6215AAD215AAD215AAD215AAD215AAD21
        5AAD215AAD215AAD215AAD215AAD215AAD3163ADD8E9ECD8E9EC218CC60894DE
        04BCF504BCF504BCF504BCF504BCF504BCF504BCF504BCF504BCF504BCF504BC
        F50873DE3163ADD8E9EC007BC617B6FA17B6FA17B6FA17A7FA17A7FA1597F915
        97F91597F91387F81387F81179F71179F7106BF7215AADD8E9EC007BC617B6FA
        17B6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1179
        F71179F7215AADD8E9EC007BC61AC7FC1AC7FCFFFFFF17B6FA17B6FA17A7FA17
        A7FA1597F91597F91597F9FFFFFF1387F81179F7215AADD8E9EC007BC61AC7FC
        1AC7FCFFFFFF17B6FA17B6FA17B6FA17A7FA17A7FA1597F91597F9FFFFFF1387
        F81387F8215AADD8E9EC007BC619D4FE19D4FEFFFFFF1AC7FC17B6FA17B6FA17
        B6FA17A7FA17A7FA1597F9FFFFFF1597F91387F8215AADD8E9EC007BC619D4FE
        19D4FEFFFFFF1AC7FC1AC7FC17B6FA17B6FA17B6FA17A7FA17A7FAFFFFFF1597
        F91597F9215AADD8E9EC007BC619D4FE19D4FEFFFFFF19D4FE1AC7FC1AC7FC17
        B6FA17B6FA17B6FA17A7FAFFFFFF17A7FA1597F9215AADD8E9EC007BC619E4FE
        19E4FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17A7
        FA17A7FA215AADD8E9EC007BC619E4FE19E4FEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF17A7FA17A7FA215AADD8E9EC007BC621EDFF
        21EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF17B6
        FA17A7FA215AADD8E9EC007BC621EDFF21EDFF21EDFF21EDFF19E4FE19D4FE19
        D4FE19D4FE1AC7FC1AC7FC17B6FA17B6FA17B6FA215AADD8E9EC218CC601A7D9
        21EDFF21EDFF21EDFF21EDFF21EDFF21EDFF21EDFF21EDFF21EDFF21EDFF21ED
        FF01A7D9218CC6D8E9ECD8E9EC218CC6007BC6007BC6007BC6007BC6007BC600
        7BC6007BC6007BC6007BC6007BC6007BC6218CC6D8E9ECD8E9EC}
      OnClick = BtnTileWindowsClick
      ExplicitLeft = 361
    end
    object BtnTableForm: TSpeedButton
      Left = 153
      Top = 1
      Width = 72
      Height = 31
      Align = alLeft
      Caption = 'Table'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C00600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF007D7D
        7D5858585252527D7D7D7D7D7D00FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF00AA9A96B6A19CC3B4B48B8384685A585B54545858587474747D7D7D00FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00AA9A96CEC3C0F2F1F0F2F2F2F9F6F4DFD7D2B5A7A7
        8977775B54545252526060608B83847D7D7D00FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF00B6A19CB2A197D7CBC6E2E2E1DCDCDCD6
        D6D6D9D9D9E9E9E9F5F5F5F3ECEBD7CBC6AA9A96786B6B565151585858707070
        7D7D7D00FF0000FF0000FF0000FF0000FF0000FF0000FF00B6A19CD6BDA2EDDD
        CADAD8D6FAFAF9FFFFFFD9D9D9ECECECDEDFE0D2D2D2DCDCDCECECECFAFAF9EB
        E5E5C3B4B4977A70685A5856515160606000FF0000FF0000FF0000FF0000FF00
        B6A19CD6BDA2EDDDCAD7D5D1E9E9E9AECAF3BBC9D7FFFFFFEBF5FFD9D9D9F5F5
        F5E9E9E9CFCFCFD2D2D2E2E2E1F9F6F4FEE3C9DFAC8F7E615E74747400FF0000
        FF0000FF0000FF00B6A19CD6BDA2EDDDCAD7D5D1ECECECDEDFE0CFCFCFD9D9D9
        A1BBE1C2CDDBFFFFFFB8E3FCD9D9D9FFFFFFECECECCFCFCFE2E2E1F3ECEB977A
        704D4D4D7D7D7D00FF0000FF0000FF00B6A19CF3C699F5E8D5D2D2D2FFFFFFFF
        FFFFD2D2D2FAFAF9EFEFEFCFCFCFD6D6D6BBC9D7D2D2D2F5F5F5B8E3FCD6D6D6
        E9E9E9D2D2D2EFECEC8977775252527D7D7D00FF0000FF00B6A19CF3C699F2E5
        D2CFCFCFE6E6E686A9F0D1D5DCFFFFFFCEE4FCD9D9D9FFFFFFF2F2F2DCDCDCDE
        DFE0BBC9D7DCDCDCFCFCFCB8E3FCCCCCCCEBE5E58B83847D7D7D00FF0000FF00
        B6A19CFFD0A2EDDFC6E4DBCDE4DBCDD8D5D0CFCFCFD6D6D6A1BBE1D2D2D2E8EC
        F286A9F0E9E9E9EBF5FFD5DADFDEDFE0D6D6D6C2CDDBE9E9E9CEC3C0AA9A967D
        7D7D00FF0000FF00B6A19CFEE3C9ECDCC0EDDFC6EEE2CDEEE2CDD9D9D9FFFFFF
        EFEFEFDCDCDCE6E6E6D2D2D2D2D2D2BBC9D7BBC9D7F2F2F29BC9FBDEDFE0D7CB
        C600FF0000FF0000FF0000FF0000FF00B6A19CFEEAD6EAD8B7ECDCC0EDDFC6E4
        DBCDDCDCDCF2F2F286A9F0E6E6E6F4F8FFC7D2E1F2F2F2F5F5F5D2D2D2E2E2E1
        C7D2E1E6E6E6C0938900FF0000FF0000FF0000FF0000FF00B6A19CF7EDDEEAD8
        B7EAD8B7ECDCC0EBDEC6E4DBCDDFD7D2D8D5D0D5D5D4C2CDDBB1BBD3E9E9E99B
        C9FBD1D5DCFFFFFFCEE4FCE6E6E600FF0000FF0000FF0000FF0000FF00B6A19C
        E6E4E3ECECE7E7D2ADEAD8B7EAD8B7ECDCC0EDDFC6EEE2CDF2E5D2F2E9DAF2E9
        DAE7E3DDE7E3DDDBD9D8D5D5D4D9D9D9A1BBE1E6E6E600FF0000FF0000FF0000
        FF0000FF00B6A19C71B1F53896FF416AEA5E80DB7D95DAB1BBD3D7CBC6EDDFC6
        EEE2CDF2E5D2F2E9DAF7EDDEF8F3E9F8F3E9FBF9F4FAFAF9F2F2F2F5F5F500FF
        0000FF0000FF0000FF0000FF00B6A19C4784FA337AFF053CFF0A47FF0A47FF13
        59FF1359FF1359FF4784FA6C99ED86A9F0C2CDDBDEDFE0F8F3E9F8F3E9FBF9F4
        FEFEFDFEFEFD00FF0000FF0000FF0000FF0000FF00B6A19C76CBF98AF0FF8AF0
        FF76CBF954AFFE4195FF398DFF2170FF2170FF1966FF1966FF2170FF2278FF29
        81FF54AFFE71B1F59BC9FBCEE4FC00FF0000FF0000FF0000FF0000FF0000FF00
        B6A19CB6A19CB6A19CB6A19CB6A19C84B2C274B9DB71B1F554AFFE54AFFE3896
        FF2E8DFF2981FF2981FF2981FF2981FF2E8DFF2E8DFF00FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF008B83847589A1568AD4568AD44784FA5E80DB7179A900FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      OnClick = BtnTableFormClick
      ExplicitLeft = 145
    end
    object BtnGraphForm: TSpeedButton
      Left = 225
      Top = 1
      Width = 72
      Height = 31
      Align = alLeft
      Caption = 'Graph'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFF000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF
        FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF
        FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFF0000FF
        0000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
        FFFFFFFFFF000000FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF0000FFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0000FFFFFFFFFFFF000000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFF0000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = BtnGraphFormClick
      ExplicitLeft = 217
    end
    object BtnScriptForm: TSpeedButton
      Left = 297
      Top = 1
      Width = 72
      Height = 31
      Align = alLeft
      Caption = 'Script'
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FFF8C795F9C8970000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FFF9CB9D0000FFCDBCB2766B75EC
        A55E0000FF0000FFF9C6930000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFA5938FCE9B6EEDAB
        6807488F004B90BE8551F0B479A58775DCA36DF9C6930000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF8D98B1
        00478F06418B73656A38AFE334B4E74A617D635C6700478F345583F7C38F0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF95AFB856C4F83299D00150933BB7EA32B3E60E6EAC045B9B17A3D7
        318FB1F2B579FAC9970000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF9494A460748F54C1F54DC0F344BBEF3BB7EA32B3E62A
        AEE121AADD18A5D81D86B4776E76EFB57B0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF2A689D0C60A051C0F44BBFF242BA
        EE52B9E43CA8D2249ED31A9ED4149ED3056BA8004E91CDA6800000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF6CC8F65DC8FB
        54C3F64BBFF247BCEECCCCCC77777727475F006EB10084BF079BCF049BCED1C1
        A20000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF7CC0D14EBAD752C2F549BEF161C5F0CCCCCC7777772864820F8EC8129FD3
        0CA0D3189BC80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FFE7D0A5F6B97DF7D0A8007F00068102389ED649BEF160C4EFCCCCCC77777730
        748E1CA7DB13A1D46E8D91FDDDBB0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFB1CFA7007F002E7C1575872F3BD55931CA4A42AADE48BDF05FC4
        EFCCCCCC77777730748E1CA7DB13A3D6C8CEC40000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF9BDD9B54ED7E1BAB2901880239D35630CA49
        0A911914A1313DBC45A088705452509F8A740000FFD7DCD10000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FFB0CDA755A4454CE4734BE47142
        DB6339D35630CA4927C13B1EB82E15AE20638B404B6E37E3B98F0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0787070C97
        124FE87749E26D44DA644BCB6336BA4B20B53019AF2612AA1B008A00008500FB
        C9970000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF58F0845BF48852EB7B49E26DA8E4B5B0B0B06A6A6A007E00008B000297
        030AA410029B03FCD4AC0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FFC9F8D566F38F50E97847E06BD1EAD6B0B0B06A6A6A
        1EB42E17AF2312AC1C1DA4177FC5720000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF44DB6646E06AD1
        EAD6B0B0B06A6A6A23BC351AB3270FA817CBAD630000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF53E87947DC68D1E4D1A4A3A26666663EB93A2DB93810AA19E9EAD10000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFE0CAB37A6D60515151FAE4CD0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      OnClick = BtnScriptFormClick
      ExplicitLeft = 273
    end
    object BtnNewProject: TSpeedButton
      Left = 1
      Top = 1
      Width = 32
      Height = 31
      Hint = #1053#1086#1074#1099#1081' '#1087#1088#1086#1077#1082#1090
      Align = alLeft
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C00600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00BE7363BE7363BE7363BE7363BE7363BE7363BE7363
        BE7363BE7363BE7363BE7363BE7363BE7363BE7363BE7363BE7363BE7363BE73
        6300FF0000FF0000FF0000FF0000FF0000FF00BE7363FFF1EAFFF1EAFFF1EAFF
        ECE6FFECE6FFECE6FFE8E1FFE8E1FFE8E1FFE4DCFFE4DCFFE4DCFFDFD7FFDFD7
        FFDFD7FFDBD3BE736300FF0000FF0000FF0000FF0000FF0000FF00BE7363FFF3
        ECFFF3ECFFF3ECFFEEE8FFEEE8FFEEE8FFEAE3FFEAE3FFEAE3FFE5DEFFE5DEFF
        E5DEFFE1D9FFE1D9FFE1D9FFDDD5BE736300FF0000FF0000FF0000FF0000FF00
        00FF00BF7565FFF5EFFFF5EFFFF5EFFFF0EAFFF0EAFFF0EAFFECE5FFECE5FFEC
        E5FFE7E0FFE7E0FFE7E0FFE3DCFFE3DCFFE3DCFFDED7BE736300FF0000FF0000
        FF0000FF0000FF0000FF00C17868FFF6F0FFF6F0FFF6F0FFF2ECFFF2ECFFF2EC
        FFEEE7FFEEE7FFEEE7FFE9E2FFE9E2FFE9E2FFE5DEFFE5DEFFE5DEFFE0D9BE73
        6300FF0000FF0000FF0000FF0000FF0000FF00C37C6CFFF6F0FFF6F0FFF6F0FF
        F6F0FFF2ECFFF2ECFFF2ECFFEEE8FFEEE8FFEEE8FFEAE3FFEAE3FFEAE3FFE5DE
        FFE5DEFFE5DEBE736300FF0000FF0000FF0000FF0000FF0000FF00C57F6FFFF6
        F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF1EBFFF1EBFFF1EBFFEDE6FFEDE6FF
        EDE6FFE8E2FFE8E2FFE8E2FFE4DDBE736300FF0000FF0000FF0000FF0000FF00
        00FF00C68373FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF2ECFFF2
        ECFFF2ECFFEDE7FFEDE7FFEDE7FFE9E2FFE9E2FFE9E2BE736300FF0000FF0000
        FF0000FF0000FF0000FF00C88677FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0
        FFF6F0FFF6F0FFF2ECFFF2ECFFF2ECFFEEE7FFEEE7FFEEE7FFE9E2FFE9E2BE73
        6300FF0000FF0000FF0000FF0000FF0000FF00CA8A7AFFF6F0FFF6F0FFF6F0FF
        F6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF1EBFFF1EBFFF1EBFFEDE6
        FFEDE6FFEDE6BE736300FF0000FF0000FF0000FF0000FF0000FF00CC8D7DFFF6
        F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FF
        F2EBFFF2EBFFF2EBFFEDE6FFEDE6BE736300FF0000FF0000FF0000FF0000FF00
        00FF00CE9181FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6
        F0FFF6F0FFF6F0FFF6F0FFF2ECFFF2ECFFF2ECFFEEE7BE736300FF0000FF0000
        FF0000FF0000FF0000FF00D09484FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0
        FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF2ECFFF2ECFFF2ECBE73
        6300FF0000FF0000FF0000FF0000FF0000FF00D29788FFF6F0FFF6F0FFF6F0FF
        F6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0
        FFF6F0FFF1EBBE736300FF0000FF0000FF0000FF0000FF0000FF00D49B8BFFF6
        F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FF
        F6F0FFF6F0FFF6F0FFF6F0FFF6F0BE736300FF0000FF0000FF0000FF0000FF00
        00FF00D59E8FFFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6
        F0FFF6F0FFF6F0EEC2B6ECBDB1ECBDB1ECBDB1EDC0B5C0736200FF0000FF0000
        FF0000FF0000FF0000FF00D7A292FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0
        FFF6F0FFF6F0FFF6F0FFF6F0F9E3DBDB8977E7A698E7A293E7A293E9AFA1C073
        6200FF0000FF0000FF0000FF0000FF0000FF00D9A596FFF6F0FFF6F0FFF6F0FF
        F6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0F6DCD3DE9483FFEFE9FFE6DE
        FFEBE4FFF6F0BE736300FF0000FF0000FF0000FF0000FF0000FF00DBA999FFF6
        F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0F7DDD4E0
        9786FFF6F0FFF6F0FFF6F0C27A6A00FF0000FF0000FF0000FF0000FF0000FF00
        00FF00DDAC9DFFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6
        F0FFF6F0F7DDD4E09786FFF6F0FFF6F0C5807000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00DFB0A0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0FFF6F0
        FFF6F0FFF6F0FFF6F0FFF6F0F7DDD4DF9686FFF6F0C9877700FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF00E1B3A4DFB0A1DFB0A1DCAA9BDA
        A798DAA798D7A192D7A192D49C8CD29989D29989CF9282CF9282CC8D7D00FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnNewProjectClick
      ExplicitLeft = -23
      ExplicitHeight = 26
    end
    object BtnOpenProject: TSpeedButton
      Left = 33
      Top = 1
      Width = 32
      Height = 31
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1088#1086#1077#1082#1090
      Align = alLeft
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C00600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF00E5E0E1DEDADBDCD8D9DAD6D7D8D4D5D7D3D4D7D3D4D6D2D3D6D2D3D6D2
        D3D6D3D2D6D3D2D6D3D2D7D4D3D8D5D4DBD8D700FF0000FF0000FF0000FF0000
        FF0000FF0000FF00A1C8DB67ABC9489BC23D95C12389BB2389BB2A8FC22A8FC2
        2A8FC22A8FC22A8FC22A8FC22A8FC21F84B72487B93D93BC569CBE79B1CE00FF
        0000FF0000FF0000FF0000FF0000FF0071B2D23B9CC83EA1CF3A9ECD3196C731
        96C7369BCD369BCD369BCD369BCD369BCD369BCD369BCD2D92C43195C6379CCA
        3699C9319DD1C2DCE900FF0000FF0000FF0000FF00CCE0EC3F91B73D9BC769CF
        F975DAFE75DAFE75DAFE74D9FE74D9FE74D9FE74D9FE74D9FE74D9FE74D9FE75
        DAFE75DAFE77DCFE6CD1FB4DBAE974BCDE00FF0000FF0000FF0000FF00C3DCEA
        3A91BB2C83AE5EC2EA75DCFE77DDFE77DCFE77DCFE77DCFE77DCFE77DCFE77DC
        FE77DCFE77DCFE77DCFE77DCFE76DBFE76DBFE5BBFE745A1CC00FF0000FF0000
        FF0000FF00B6D6E73397CA2980A952B2D67BE3FE7FE5FE7FE4FE7FE4FE7FE4FE
        7FE4FE7FE4FE7FE4FE7FE4FE7FE4FE7FE4FE7FE4FE7FE4FE80E5FE6DD2F3379B
        C9B9D4E300FF0000FF0000FF00A5CEE23398CB328BB4409CC27BE3FB84EAFE82
        E8FE82E8FE82E8FE82E8FE82E8FE82E8FE82E8FE82E8FE82E8FE82E8FE82E8FE
        83E9FE7BE0F946ABD58EBDD700FF0000FF0000FF00A8D0E53398CB45A2C5358D
        B579DFF48FF5FE8BF1FE8BF1FE8BF1FE8BF1FE8BF1FE8BF1FE8BF1FE8BF1FE8B
        F1FE8BF1FE8BF1FE8CF2FE89F0FC61C6E362A8CD00FF0000FF0000FF009FCBE3
        3398CB54B4D3368DB27ADCEB99FEFE94F9FE94F9FE94F9FE94F9FE94F9FE94F9
        FE94F9FE94F9FE94F9FE94F9FE94F9FE95FAFE96FBFE79DFF04AA0CA00FF0000
        FF0000FF0096C6E03398CB68CDE53A92B56BC7D79CFEFE98FCFE98FCFE98FCFE
        98FCFE98FCFE98FCFE98FCFE98FCFE98FCFE98FCFE98FCFE98FCFE99FDFE8AEF
        F747A9CFB2D0E200FF0000FF007FBCDB3398CB71D7EA53B2CF52A6BBB8FEFEB8
        FEFEB8FEFEB8FEFEB8FEFEB8FEFEB8FEFEB8FEFEB8FEFEB8FEFEB8FEFEB8FEFE
        B8FEFEB9FEFEB3FAFC6EC3DE7DB5D400FF0000FF0068B1D63398CB7AE0EF63C8
        E04492ACE5F3F6F8FEFEF7FEFEF6FEFEF6FEFEF6FEFEF6FEFEF6FEFEF6FEFEF6
        FEFEF6FEFEF6FEFEF6FEFEF4FEFEF3FEFEBFE0EE8EC0DA00FF0000FF0049A2D0
        3398CB7AE0EF70D7EA3188B157A0C2D1F4FED0F4FECFF4FECFF4FECFF4FECFF4
        FECFF4FECFF4FECFF4FECFF4FECFF4FECFF4FECEF4FECDF4FEAAD5E89DC9DF00
        FF0000FF0049A2D03398CB7AE0EF7AE0EF3C9CC526759F5CBAE25CBAE25BB9E1
        5BB9E15BB9E15CB9E15BB9E15BB9E15BB9E15BB9E15BB9E15BB9E15BB9E15CBB
        E482BDDC00FF0000FF0000FF0049A2D03398CB7AE0EF7AE0EF67CDE669CEE638
        9DCA40A6D23398CB3398CB3398CB3398CB3398CB3398CB3398CB3398CB3499CB
        3398CB3398CB8DC2DEBAD7E700FF0000FF0000FF007BBBDB408CB175D7E97AE0
        EF7AE0EF7AE0EF7AE0EF7AE0EF3297CAA1CDE300FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        72B0CF8FC5E2C0E6F2FEFEFEFEFEFEFEFEFEBEE4F06EB5D8D9E6F000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF00A3CDE53398CB3398CB3398CB3398CB3196C974B7D9C0DAEA
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnOpenProjectClick
      ExplicitLeft = 49
    end
    object BtnSaveProject: TSpeedButton
      Left = 65
      Top = 1
      Width = 32
      Height = 31
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Align = alLeft
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C00600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF00D4D0CFC5C2C1C0BDBDC0BCBCBEBABABDBAB9BDBAB9
        BDBAB9BDBAB9BDBAB9BCB9B8BCB9B8BCB9B8BDBAB9BFBCB9C2BFBCC4C1BEC7C5
        C2D0CDCA00FF0000FF0000FF0000FF00A8A29E6E6762665F58635C56625B5562
        5B55625B55625B55625B55625B55625B55625B55615B55615B55615B556C665F
        6D6760655E5768625A938E88DEDCD800FF0000FF0000FF007C746FC97F75C97F
        75AD6558AA908DEACDCAFDF6F6FDF6F5FCF4F3FAF0EEF7E8E6F5DFDBF1D5D2EC
        CBC7E6C0BAB5837C9F5F56C97F75C97F756D655FDCD9D800FF0000FF0000FF00
        7F7771CA8076CA8076B36355BD9593FDF3F2E8C7C3D59992D8A199FDF3F2FBEE
        ECF8E6E3F5DCD9F1D2CFEDCAC5CE9690AF6259CA8076CA80766F6861DCD9D800
        FF0000FF0000FF00827B74CC8177CC8177B5665AC09B99FDF0EEB8746EC67970
        D39188FEF6F5FEF3F2FCEDEBF9E4E1F6DBD7F2D2CFD09890B16058CC8177CC81
        77736B65DCD9D800FF0000FF0000FF00857D77CF857ACE8378BC695CC5A19DFE
        ECE9B1645CC87A71D6938AFEF9F8FEF7F5FEF3F2FEEDEBFBE5E1F8DDD9D19993
        B36159CE8378CE8378746D67DCD9D800FF0000FF0000FF0088817BD58F86D38A
        81C06C5FC8A4A0FEE9E6B3655DC4746AD28E84FEFBFAFEFCFAFEFAF8FEF5F2FE
        EEECFEE6E4D49C96B6645AD1847AD1847A78716BDDDAD900FF0000FF0000FF00
        8C857FDA9990D9988ED28579DBB7B3FEE5E1FEE8E4FEEDEAFEF4F1FEFAF8FEFD
        FCFEFEFEFEFDFCFEF9F8F9DBD7D29189BF6D64D3867BD3867B7A736EDDDAD900
        FF0000FF0000FF00908983DE9F96DE9F96DD9D94DC9A91DA958BD88D82D6887D
        D6887DD6887DD6887DD6887DD6887DD6887DD6887DD6887DD6887DD6887DD688
        7D7D7771DDDAD900FF0000FF0000FF00948D87E1A098D18980D28D84D18A82D0
        837ACC7970C97369C97268C87268C87268C87168C87269C9736AC9746CC8746B
        C8746AC76D62DA8A7F817A74DFDCDB00FF0000FF0000FF0097908BE4A299D691
        88EFC7C1F7D6D2F7D4D0F7D1CCF6CFCAF6CFCAF6CFCAF6CFCAF6CFCAF6CFCAF6
        CFCAF6CFCBF5CEC9ECBAB5CD776DDE8C81847E78DFDCDB00FF0000FF0000FF00
        9B948FE7A49BD8938AF8D9D4FEE9E6FEE8E5FEE7E4FEE6E3FEE6E2FEE6E2FEE6
        E2FEE6E2FEE6E2FEE6E2FEE6E2FEE4E1F7CFCBD0796EE18E8387817BDFDCDB00
        FF0000FF0000FF009F9993EAA69CDB948CF9DBD8FEECEAFEECEAFEEBE8FEEAE7
        FEEAE7FEEAE7FEEAE7FEEAE7FEEAE7FEEAE7FEEAE7FEE9E6F8D3D0D37B71E591
        858B847FE0DDDC00FF0000FF0000FF00A29C96ECA89EDD968EF9DFDBFEF0EDFE
        F0EDFEEFECFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEDEA
        F8D7D3D67D72E893878D8681E0DDDC00FF0000FF0000FF00A69F9AEFADA3E09C
        93FAE3DFFEF3F1FEF3F1FEF3F0FEF2EFFEF2EFFEF2EFFEF2EFFEF2EFFEF2EFFE
        F1EFFEF1EEFEF0EDF9DAD5D77D72EB9589918B85E1DEDD00FF0000FF0000FF00
        A9A29DF3B4ACE5A69EFAE7E4FEF6F5FEF6F5FEF6F5FEF6F5FEF6F5FEF6F5FEF5
        F4FEF5F4FEF5F4FEF5F4FEF5F3FEF3F1F9DDD8D97F74EE978B938D87E1DEDD00
        FF0000FF0000FF00ABA4A0F6BCB4EAB1A9FBECE9FEF9F7FEFAF8FEF9F7FEF9F7
        FEF9F7FEF9F7FEF9F7FEF9F7FEF9F7FEF9F7FEF8F6FEF6F4F9E0DBDF8378F299
        8D958F8AE2DEDE00FF0000FF0000FF00AEA8A3F8C2BBEFBDB7FCF0EDFEFBF9FE
        FBF9FEFBF9FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFAF7FEF9F5
        FAE5E0E08C82F49A8E99938DE3DFDE00FF0000FF0000FF00B0AAA5FAC8C1F1C4
        BFFCF2EFFEFCFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFE
        FDFAFEFCF9FEFBF8F7E7E4D68E87F69C909D9792E6E2E100FF0000FF0000FF00
        B3ADA8FBCCC6E9C1BAF3E5E2F4F0EEF4F2EEF4F2EEF4F2EEF4F2EEF4F2EEF4F2
        EEF4F2EEF4F2EEF4F2EEF4F0EDF4EFECF1DCD8DD988DF9A295AAA49F00FF0000
        FF0000FF0000FF00D2CCC9B4AEAABAB4B0BAB4B0BAB4B0BAB4B0BAB4B0BAB4B0
        BAB4B0BAB4B0BAB4B0BAB4B0B9B3AFB9B3AFB9B3AFB9B3AFB9B3AFB9B3AFB3AC
        A8CFC9C600FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnSaveProjectClick
      ExplicitLeft = 129
    end
    object BtnSaveProjectAs: TSpeedButton
      Left = 97
      Top = 1
      Width = 32
      Height = 31
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      Align = alLeft
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C00600000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000FF0000FF0000FF00D4D0CFC5C2C1C0BDBDC0BCBCBEBABABDBAB9000000
        A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00000000FF0000FF00A8A29E6E6762665F58635C56625B5562
        5B55625B55000000A9A9A9FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000FF007C746FC97F75C97F
        75AD6558AA908DEACDCAFDF6F6000000A9A9A9FFFFFFFFFFFF000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000FF00
        7F7771CA8076CA8076B36355BD9593FDF3F2E8C7C3000000A9A9A9FFFFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        000000FF0000FF00827B74CC8177CC8177B5665AC09B99FDF0EEB8746E000000
        A9A9A9FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00000000FF0000FF00857D77CF857ACE8378BC695CC5A19DFE
        ECE9B1645C000000A9A9A9FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000FF0088817BD58F86D38A
        81C06C5FC8A4A0FEE9E6B3655D000000A9A9A9FFFFFFFFFFFF000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000FF00
        8C857FDA9990D9988ED28579DBB7B3FEE5E1FEE8E4000000A9A9A9FFFFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        000000FF0000FF00908983DE9F96DE9F96DD9D94DC9A91DA958BD88D82000000
        A9A9A9FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00000000FF0000FF00948D87E1A098D18980D28D84D18A82D0
        837ACC7970000000A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9A9
        A9A9A9A9A9A9A9A9A9A9A9A9A9A9A900000000FF0000FF0097908BE4A299D691
        88EFC7C1F7D6D2F7D4D0F7D1CC00000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000FF0000FF00
        9B948FE7A49BD8938AF8D9D4FEE9E6FEE8E5FEE7E4FEE6E3FEE6E2FEE6E2FEE6
        E2FEE6E2FEE6E2FEE6E2FEE6E2FEE4E1F7CFCBD0796EE18E8387817BDFDCDB00
        FF0000FF0000FF009F9993EAA69CDB948CF9DBD8FEECEAFEECEAFEEBE8FEEAE7
        FEEAE7FEEAE7FEEAE7FEEAE7FEEAE7FEEAE7FEEAE7FEE9E6F8D3D0D37B71E591
        858B847FE0DDDC00FF0000FF0000FF00A29C96ECA89EDD968EF9DFDBFEF0EDFE
        F0EDFEEFECFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEEEBFEEDEA
        F8D7D3D67D72E893878D8681E0DDDC00FF0000FF0000FF00A69F9AEFADA3E09C
        93FAE3DFFEF3F1FEF3F1FEF3F0FEF2EFFEF2EFFEF2EFFEF2EFFEF2EFFEF2EFFE
        F1EFFEF1EEFEF0EDF9DAD5D77D72EB9589918B85E1DEDD00FF0000FF0000FF00
        A9A29DF3B4ACE5A69EFAE7E4FEF6F5FEF6F5FEF6F5FEF6F5FEF6F5FEF6F5FEF5
        F4FEF5F4FEF5F4FEF5F4FEF5F3FEF3F1F9DDD8D97F74EE978B938D87E1DEDD00
        FF0000FF0000FF00ABA4A0F6BCB4EAB1A9FBECE9FEF9F7FEFAF8FEF9F7FEF9F7
        FEF9F7FEF9F7FEF9F7FEF9F7FEF9F7FEF9F7FEF8F6FEF6F4F9E0DBDF8378F299
        8D958F8AE2DEDE00FF0000FF0000FF00AEA8A3F8C2BBEFBDB7FCF0EDFEFBF9FE
        FBF9FEFBF9FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFBF8FEFAF7FEF9F5
        FAE5E0E08C82F49A8E99938DE3DFDE00FF0000FF0000FF00B0AAA5FAC8C1F1C4
        BFFCF2EFFEFCFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFEFDFAFE
        FDFAFEFCF9FEFBF8F7E7E4D68E87F69C909D9792E6E2E100FF0000FF0000FF00
        B3ADA8FBCCC6E9C1BAF3E5E2F4F0EEF4F2EEF4F2EEF4F2EEF4F2EEF4F2EEF4F2
        EEF4F2EEF4F2EEF4F2EEF4F0EDF4EFECF1DCD8DD988DF9A295AAA49F00FF0000
        FF0000FF0000FF00D2CCC9B4AEAABAB4B0BAB4B0BAB4B0BAB4B0BAB4B0BAB4B0
        BAB4B0BAB4B0BAB4B0BAB4B0B9B3AFB9B3AFB9B3AFB9B3AFB9B3AFB9B3AFB3AC
        A8CFC9C600FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = BtnSaveProjectAsClick
      ExplicitLeft = 113
    end
    object Panel1: TPanel
      Left = 129
      Top = 1
      Width = 24
      Height = 31
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object InitTimer: TTimer
    Interval = 1
    OnTimer = InitTimerTimer
    Left = 64
    Top = 168
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 144
    Top = 168
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'tabg'
    Filter = #1055#1088#1086#1077#1082#1090' Tablograph|*.tabg|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 64
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'tabg'
    Filter = #1055#1088#1086#1077#1082#1090' Tablograph|*.tabg|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 152
    Top = 56
  end
end
