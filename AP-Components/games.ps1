# =======================================START=OF=COMPILER================================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.3) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ========================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
if($AP_CONSOLE.mode -ne 'main' -or $AP_CONSOLE.customFlags.runAsCompiled) {
    $Script:AP_CONSOLE = [PsCustomObject]@{version=[version]'1.3'; mode = 'shim'; customFlags = @{}}
    function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
    # This syntax is to prevent AV's from misclassifying this as anything but innocuous
    & (Get-Alias iex) (B64 "ZnVuY3Rpb24gV3JpdGUtQVAgew0KICAgIFtDbWRsZXRCaW5kaW5nKCldDQogICAgcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0xLCBNYW5kYXRvcnk9MSldJFRleHQsW1N3aXRjaF0kTm9TaWduLFtTd2l0Y2hdJFBsYWluVGV4dCxbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdMZWZ0JyxbU3dpdGNoXSRQYXNzVGhydSkNCiAgICBiZWdpbiB7JFRUID0gQCgpfQ0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9DQogICAgRU5EIHsNCiAgICAgICAgJEJsdWUgPSAkKGlmICgkQVBfQ09OU09MRS5jdXN0b21GbGFncy5sZWdhY3lDb2xvcnMpezN9ZWxzZXsnQmx1ZSd9KQ0KICAgICAgICBpZiAoJFRULmNvdW50IC1lcSAxKSB7JFRUID0gJFRUWzBdfTskVGV4dCA9ICRUVA0KICAgICAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7DQogICAgICAgICAgICByZXR1cm4gJFRleHQgfCAlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1BUCAkXyAtTm9TaWduOiROb1NpZ24gLVBsYWluVGV4dDokUGxhaW5UZXh0IC1BbGlnbiAkQWxpZ24gLVBhc3NUaHJ1OiRQYXNzVGhydQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICghJHRleHQgLW9yICR0ZXh0IC1ub3RtYXRjaCAiKD9zbWkpXigoPzxOTkw+eCl8KD88TlM+bnM/KSl7MCwyfSg/PHQ+XD4qKSg/PHM+W1wrXC1cIVwqXCNcQF9dKSg/PHc+LiopIikge3JldHVybiBBbGlnbi1UZXh0ICRUZXh0IC1BbGlnbiAkQWxpZ24gfCBXcml0ZS1Ib3N0fQ0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoDQogICAgICAgICRDb2wgPSBAeycrJz0nMic7Jy0nPScxMic7JyEnPScxNCc7JyonPSRCbHVlOycjJz0nRGFya0dyYXknOydAJz0nR3JheSc7J18nPSd3aGl0ZSd9WygkU2lnbiA9ICRNYXRjaGVzLlMpXQ0KICAgICAgICBpZiAoISRDb2wpIHtUaHJvdyAiSW5jb3JyZWN0IFNpZ24gWyRTaWduXSBQYXNzZWQhIn0NCiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkNCiAgICAgICAgJERhdGEgPSAiJHRiJFNpZ24kKCRNYXRjaGVzLlcpIjtpZiAoISREYXRhKSB7cmV0dXJuIFdyaXRlLUhvc3QgIiJ9DQogICAgICAgIGlmIChBUC1SZXF1aXJlICJmdW5jdGlvbjpBbGlnbi1UZXh0IiAtcGEpIHsNCiAgICAgICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiDQogICAgICAgIH0NCiAgICAgICAgaWYgKCRQbGFpblRleHQpIHtyZXR1cm4gJERhdGF9DQogICAgICAgICREYXRhTGluZXMgPSAkRGF0YSAtc3BsaXQgImBuIg0KICAgICAgICAxLi4kRGF0YUxpbmVzLkNvdW50IHwgJSB7DQogICAgICAgICAgICAkSWR4ID0gJF8gLSAxDQogICAgICAgICAgICAkTk5MID0gISRpZHggLWFuZCAkTWF0Y2hlcy5OTkwNCiAgICAgICAgICAgIFdyaXRlLUhvc3QgLU5vTmV3TGluZTokTk5MIC1mICRDb2wgJERhdGFMaW5lc1skSWR4XQ0KICAgICAgICAgICAgaWYgKCRQYXNzVGhydSkge3JldHVybiAkRGF0YX0NCiAgICAgICAgfQ0KICAgIH0NCn0KCmZ1bmN0aW9uIFByb2Nlc3MtVW5pY29kZSB7DQogICAgJEZpbmFsQXJncyA9IEZsYXR0ZW4gJGFyZ3MNCiAgICAjIFBvd2VyU2hlbGwgQ29yZSBzeW50YXggd2hlbiBwcm9jZXNzZWQgYnkgUG93ZXJTaGVsbCBOYXRpdmUNCiAgICBpZiAoIiRGaW5hbEFyZ3MiIC1tYXRjaCAidXsoXHcrKX0iKSB7DQogICAgICAgIHJldHVybiBbUmVnZXhdOjpVbmVzY2FwZSgoIiRGaW5hbEFyZ3MiIC1yZXBsYWNlICJ1eyhcdyspfSIsJ1x1JDEnKSkNCiAgICB9DQogICAgaWYgKCEoJEZpbmFsQXJncyB8ID8geyRfIC1pc25vdCBbaW50XX0pKSB7DQogICAgICAgIHJldHVybiBbY2hhcltdXSRGaW5hbEFyZ3MgLWpvaW4gJycNCiAgICB9DQogICAgcmV0dXJuICRhcmdzDQp9CgpmdW5jdGlvbiBBUC1Db252ZXJ0UGF0aCB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtTdHJpbmddJFBhdGgpDQoNCiAgICAkUGF0aFNlcCA9IFtJTy5QYXRoXTo6RGlyZWN0b3J5U2VwYXJhdG9yQ2hhcg0KICAgIHJldHVybiAkUGF0aCAtcmVwbGFjZQ0KICAgICAgICAiPERlcD4iLCI8TGliPiR7UGF0aFNlcH1EZXBlbmRlbmNpZXMiIC1yZXBsYWNlDQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlDQogICAgICAgICI8Q29tcChvbmVudHMpPz4iLCI8SG9tZT4ke1BhdGhTZXB9QVAtQ29tcG9uZW50cyIgLXJlcGxhY2UNCiAgICAgICAgIjxIb21lPiIsJFBTSGVsbH0KCmZ1bmN0aW9uIEdldC1QYXRoVmFyU2VwIHtwYXJhbShbc3RyaW5nXSRPdmVycmlkZSA9ICIiKQ0KDQogICAgJElzVW5peCA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiDQogICAgcmV0dXJuIEpTLU9SICRPdmVycmlkZSAoPzogJElzVW5peCAiOiIgIjsiKQ0KfQoKZnVuY3Rpb24gR2V0LVdoZXJlIHsNCiAgICBbQ21kbGV0QmluZGluZyhEZWZhdWx0UGFyYW1ldGVyU2V0TmFtZT0iTm9ybWFsIildDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBQb3NpdGlvbj0wKV1bc3RyaW5nXSRGaWxlLA0KICAgICAgICBbU3dpdGNoXSRBbGwsDQogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwNCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kRGJnLA0KICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiDQogICAgKQ0KICAgICRJc1ZlcmJvc2UgPSAkRGJnIC1vciAkUFNDbWRsZXQuTXlJbnZvY2F0aW9uLkJvdW5kUGFyYW1ldGVycy5WZXJib3NlIC1vciAkUFNDbWRsZXQuTXlJbnZvY2F0aW9uLkJvdW5kUGFyYW1ldGVycy5EZWJ1Zw0KICAgICRXaGVyZUJpbkV4aXN0cyA9IEdldC1Db21tYW5kICJ3aGVyZSIgLWVhIFNpbGVudGx5Q29udGludWUNCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCINCiAgICBpZiAoJEZpbGUgLWVxICJ3aGVyZSIgLW9yICRGaWxlIC1lcSAid2hlcmUuZXhlIikge3JldHVybiAkV2hlcmVCaW5FeGlzdHN9DQogICAgaWYgKCRXaGVyZUJpbkV4aXN0cyAtYW5kICEkTWFudWFsU2Nhbikgew0KICAgICAgICAkT3V0PSRudWxsDQogICAgICAgIGlmICgkSXNVbml4KSB7DQogICAgICAgICAgICAkT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbA0KICAgICAgICB9IGVsc2UgeyRPdXQgPSB3aGVyZS5leGUgJGZpbGUgMj4kbnVsbH0NCg0KICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59DQogICAgICAgIGlmICgkQWxsKSB7cmV0dXJuICRPdXR9DQogICAgICAgIHJldHVybiBAKCRPdXQpWzBdDQogICAgfQ0KICAgIGZvcmVhY2ggKCRGb2xkZXIgaW4gKEdldC1QYXRoIC1QYXRoVmFyICRQYXRoVmFyKSkgew0KICAgICAgICBpZiAoJElzVW5peCkgew0KICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIg0KICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICBpZiAoIShUZXN0LVBhdGggLVBhdGhUeXBlIExlYWYgJExvb2t1cCkpIHtjb250aW51ZX0NCiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoDQogICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgIH0gZWxzZSB7DQogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgew0KICAgICAgICAgICAgICAgICRMb29rdXAgPSAiJEZvbGRlci8kRmlsZSRFeHRlbnNpb24iDQogICAgICAgICAgICAgICAgaWYgKCRJc1ZlcmJvc2UpIHtXcml0ZS1BUCAiKkNoZWNraW5nIFskTG9va3VwXSJ9DQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9DQogICAgICAgICAgICAgICAgUmVzb2x2ZS1QYXRoICRMb29rdXAgfCAlIFBhdGgNCiAgICAgICAgICAgICAgICBpZiAoISRBbGwpIHtyZXR1cm59DQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9CgpmdW5jdGlvbiBBbGlnbi1UZXh0IHsNCiAgICBbQ21kbGV0QmluZGluZygpXQ0KICAgIFtPdXRwdXRUeXBlKFtTdHJpbmddLCBbSGFzaHRhYmxlXSldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5PTEsIFZhbHVlRnJvbVBpcGVsaW5lPTEpXVtBbGxvd0VtcHR5U3RyaW5nKCldW1N0cmluZ1tdXSRUZXh0LA0KICAgICAgICBbc3dpdGNoXSRDb2xvckNvZGVzRGlzY3JldGVQZXJMaW5lLA0KICAgICAgICBbc3dpdGNoXSRQb3JjZWxhaW4sDQogICAgICAgICMgVGhpcyBjYW4gYmUgW2ludF0gb3IgW3NjcmlwdGJsb2NrXQ0KICAgICAgICAkQ29uc3RyYWluVG9XaWR0aCwNCiAgICAgICAgW1ZhbGlkYXRlU2V0KCJDZW50ZXIiLCJSaWdodCIsIkxlZnQiKV1bU3RyaW5nXSRBbGlnbj0nQ2VudGVyJw0KICAgICkNCiAgICBiZWdpbiB7DQogICAgICAgICRpc1ZlcmJvc2UgPSAkUFNDbWRsZXQuTXlJbnZvY2F0aW9uLkJvdW5kUGFyYW1ldGVycy5WZXJib3NlDQogICAgICAgICRFc2NhcGVDb2RlU3BsaXR0ZXIgPSAiJChbcmVnZXhdOjplc2NhcGUoIiQoR2V0LUVzY2FwZSlbIikpXGQrKD86XDtcZCspKm0iDQogICAgICAgICREaXZpZGVycyA9IEB7Y2h1bmsgPSBQcm9jZXNzLVVuaWNvZGUgImB1ezExMjg4fSI7IHN0eWxlID0gUHJvY2Vzcy1Vbmljb2RlICJgdXsxMjI4OH0ifQ0KICAgICAgICAkRmluYWxGb3JtYXR0ZXIgPSB7DQogICAgICAgICAgICBwYXJhbSgkTGluZXMsICRTdHlsZXMpDQogICAgICAgICAgICBpZiAoISRQb3JjZWxhaW4pIHtyZXR1cm4gJExpbmVzfQ0KICAgICAgICAgICAgaWYgKCRudWxsIC1lcSAkU3R5bGVzKSB7JFN0eWxlcyA9IFtSZWdleF06Ok1hdGNoZXMoKCRMaW5lcyAtam9pbiAiIiksICRFc2NhcGVDb2RlU3BsaXR0ZXIpLnZhbHVlfQ0KICAgICAgICAgICAgcmV0dXJuIEB7TGluZXMgPSAkTGluZXM7IFJ1bm5pbmdTdHlsZXMgPSAkU3R5bGVzfQ0KICAgICAgICB9DQogICAgfQ0KICAgIHByb2Nlc3Mgew0KICAgICAgICBpZiAoJEFsaWduIC1lcSAiTGVmdCIpIHtyZXR1cm4gJiAkRmluYWxGb3JtYXR0ZXIgJFRleHR9DQogICAgICAgIGlmICghIiRUZXh0Ii50cmltKCkpIHtyZXR1cm4gJFRleHR9DQogICAgICAgICRXaW5TaXplID0gPzogJENvbnN0cmFpblRvV2lkdGgge0ludm9rZS1PclJldHVybiAkQ29uc3RyYWluVG9XaWR0aH0gKFtjb25zb2xlXTo6QnVmZmVyV2lkdGgpDQogICAgICAgIA0KICAgICAgICAkVGV4dCA9ICRUZXh0IC1zcGxpdCAiYHI/YG4iDQogICAgICAgIGlmICgkVGV4dC5jb3VudCAtZ3QgMSkgew0KICAgICAgICAgICAgJExpbmVzID0gJFRleHQgfCBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gLUNvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmU6JENvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmUgLVBvcmNlbGFpbg0KICAgICAgICAgICAgaWYgKCRDb2xvckNvZGVzRGlzY3JldGVQZXJMaW5lKSB7DQogICAgICAgICAgICAgICAgZm9yICgkaSA9IDE7ICRpIC1sdCAkTGluZXMuQ291bnQ7ICRpKyspIHsNCiAgICAgICAgICAgICAgICAgICAgJExpbmUgPSAkTGluZXNbJGldDQogICAgICAgICAgICAgICAgICAgICRQcmV2U3R5bGVzICs9ICRMaW5lc1skaSAtIDFdLlJ1bm5pbmdTdHlsZXMNCiAgICAgICAgICAgICAgICAgICAgJExpbmUuTGluZXMgPSAkTGluZS5MaW5lcyB8ICUgeyIkUHJldlN0eWxlcyRfIn0NCiAgICAgICAgICAgICAgICAgICAgJExpbmUuUnVubmluZ1N0eWxlcyA9ICIkUHJldlN0eWxlcyQoJExpbmUuUnVubmluZ1N0eWxlcykiDQogICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgcmV0dXJuICYgJEZpbmFsRm9ybWF0dGVyIChGbGF0dGVuICRMaW5lcy5MaW5lcykgKCRMaW5lcy5SdW5uaW5nU3R5bGVzIC1qb2luICIiKQ0KICAgICAgICB9DQogICAgICAgICMgU2luZ2xlIG5vbiBgbiBsaW5lIHByb2Nlc3MNCiAgICAgICAgJENsZWFuVGV4dFNpemUgPSAoU3RyaXAtQ29sb3JDb2RlcyAoIiIrJFRleHQpKS5MZW5ndGgNCg0KICAgICAgICAjID09PT09PT09IExpbmUgaXMgPCAkV2luU2l6ZSA9PT09PT09PT09PT09PXwNCiAgICAgICAgaWYgKCRDbGVhblRleHRTaXplIC1sZSAkV2luU2l6ZSkgew0KICAgICAgICAgICAgaWYgKCRBbGlnbiAtZXEgIkNlbnRlciIpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gJiAkRmluYWxGb3JtYXR0ZXIgKCIgIipbbWF0aF06OnRydW5jYXRlKCgkV2luU2l6ZS0kQ2xlYW5UZXh0U2l6ZSkvMikrJFRleHQpDQogICAgICAgICAgICB9DQogICAgICAgICAgICAjIFJpZ2h0DQogICAgICAgICAgICByZXR1cm4gJiAkRmluYWxGb3JtYXR0ZXIgKCIgIiooJFdpblNpemUtJENsZWFuVGV4dFNpemUpKyRUZXh0KQ0KICAgICAgICB9DQoNCiAgICAgICAgIyA9PT09PT09PSBMaW5lIGlzID49ICRXaW5TaXplID09PT09PT09PT09PT09fA0KICAgICAgICAjIFRyYWNraW5nIFN0eWxlcw0KICAgICAgICAkUnVubmluZ1N0eWxlcyA9ICIiDQogICAgICAgICRDdXJybGluZSA9IEB7DQogICAgICAgICAgICBzdHlsZWREYXRhID0gIiINCiAgICAgICAgICAgIGNvbnRlbnRTaXplID0gMA0KICAgICAgICAgICAgZmluYWxMaW5lcyA9IEAoKQ0KICAgICAgICAgICAgbmV4dCA9IHsNCiAgICAgICAgICAgICAgICAjIFdyaXRlLVZlcmJvc2UgIiokSW52b2sgfCBOZXcgTGluZSB8IExpbmVEYXRhOiAkKCgnJyskQ3VycmxpbmUuc3R5bGVkRGF0YS5MZW5ndGgpLlBhZExlZnQoMykpIg0KICAgICAgICAgICAgICAgICRDdXJybGluZS5maW5hbExpbmVzICs9ICwkQ3VycmxpbmUuc3R5bGVkRGF0YQ0KICAgICAgICAgICAgICAgICRDdXJybGluZS5zdHlsZWREYXRhID0gJFJ1bm5pbmdTdHlsZXMNCiAgICAgICAgICAgICAgICAkQ3VycmxpbmUuY29udGVudFNpemUgPSAwDQogICAgICAgICAgICAgICAgIyBXcml0ZS1WZXJib3NlICIqJEludm9rIHwgQ3VyciBUb3RhbCBMaW5lczogJCgkY3VycmxpbmUuZmluYWxMaW5lcy5Db3VudCkiDQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgICAgJEFsbENodW5rcyA9ICRUZXh0IC1yZXBsYWNlICIoJHtFc2NhcGVDb2RlU3BsaXR0ZXJ9KSsoLio/KSg/PSR7RXNjYXBlQ29kZVNwbGl0dGVyfXwkKSIsIiQoJERpdmlkZXJzLmNodW5rKWAkMSQoJERpdmlkZXJzLnN0eWxlKWAkMiIgLXNwbGl0ICREaXZpZGVycy5jaHVuaw0KICAgICAgICBpZiAoJEFsbENodW5rc1swXSAtbm90Y29udGFpbnMgJERpdmlkZXJzLnN0eWxlKSB7JEFsbENodW5rc1swXSA9ICIkKCREaXZpZGVycy5zdHlsZSkkKCRBbGxDaHVua3NbMF0pIn0gIyBUaGUgZmlyc3QgY2h1bmsgY291bGQgaGF2ZSBubyBzdHlsZXMNCiAgICAgICAgZm9yZWFjaCAoJEN1cnJDaHVuayBpbiAkQWxsQ2h1bmtzKSB7DQogICAgICAgICAgICAkU3R5bGUsJFRleHRDaHVuayA9ICRDdXJyQ2h1bmsgLXNwbGl0ICREaXZpZGVycy5zdHlsZQ0KICAgICAgICAgICAgJFJ1bm5pbmdTdHlsZXMgPSA/OiAkQ29sb3JDb2Rlc0Rpc2NyZXRlUGVyTGluZSAiJFJ1bm5pbmdTdHlsZXMkU3R5bGUiICRTdHlsZQ0KICAgICAgICAgICAgIyBXcml0ZS1Ib3N0IC1mIDIgKCJJbmNvbWluZ1N0eWxlOiAkU3R5bGUgfCBSdW5uaW5nU3R5bGVzOiAkUnVubmluZ1N0eWxlcyIgLXJlcGxhY2UgKFtyZWdleF06OkVzY2FwZSgkKEdldC1Fc2NhcGUpKSksJ1xlJykNCiAgICAgICAgICAgICMgV3JpdGUtSG9zdCAtZiBZZWxsb3cgIlRleHRDaHVuazogJFRleHRDaHVuayINCiAgICAgICAgICAgICRDdXJybGluZS5zdHlsZWREYXRhICs9ICRSdW5uaW5nU3R5bGVzDQogICAgICAgICAgICAkVGV4dENodW5rU3RySW5kZXggPSAwDQogICAgICAgICAgICAjIFdyaXRlLVZlcmJvc2UgIiokSW52b2sgfCBUZXh0Q2h1bms6ICRUZXh0Q2h1bmsgfCBBbGxDaHVua3NTaXplOiAkKCgnJyskQWxsQ2h1bmtzLkxlbmd0aCkuUGFkTGVmdCgzKSkiDQogICAgICAgICAgICB3aGlsZSgkVGV4dENodW5rU3RySW5kZXggLWx0ICRUZXh0Q2h1bmsuTGVuZ3RoKSB7DQogICAgICAgICAgICAgICAgaWYgKCRpc1ZlcmJvc2UpIHtQbGFjZS1CdWZmZXJlZENvbnRlbnQgKCIkSW52b2sgfCBMaW5lRGF0YTogJCgoJycrJEN1cnJsaW5lLnN0eWxlZERhdGEuTGVuZ3RoKS5QYWRMZWZ0KDMpKSB8IENodW5rSWR4OiAkKCgnJyskVGV4dENodW5rU3RySW5kZXgpLlBhZExlZnQoMykpIHwgQ2h1bmtMZW46ICQoJFRleHRDaHVuay5MZW5ndGgpIHwgRmluYWxMaW5lczogJCgkQ3VycmxpbmUuZmluYWxMaW5lcy5Db3VudCkiKSAteCAwIC15IChbQ29uc29sZV06OkJ1ZmZlckhlaWdodCAtIDEpIFllbGxvdyBEYXJrR3JheX0NCiAgICAgICAgICAgICAgICAkQ2h1bmtTaXplID0gJFRleHRDaHVuay5MZW5ndGggLSAkVGV4dENodW5rU3RySW5kZXgNCiAgICAgICAgICAgICAgICBXcml0ZS1WZXJib3NlICIqQ2h1bmtTaXplOiAkQ2h1bmtTaXplIHwgJCgkQ3VycmxpbmUuY29udGVudFNpemUpIHwgJFdpblNpemUiDQogICAgICAgICAgICAgICAgaWYgKCgkQ3VycmxpbmUuY29udGVudFNpemUrJENodW5rU2l6ZSkgLWx0ICRXaW5TaXplKSB7DQogICAgICAgICAgICAgICAgICAgICMgSWYgdGhlIGN1cnJlbnQgY2h1bmsgZml0cyBpbiB0aGUgY3VycmVudCBsaW5lDQogICAgICAgICAgICAgICAgICAgICRDdXJybGluZS5zdHlsZWREYXRhICs9ICRUZXh0Q2h1bmsuU3Vic3RyaW5nKCRUZXh0Q2h1bmtTdHJJbmRleCkNCiAgICAgICAgICAgICAgICAgICAgJEN1cnJsaW5lLmNvbnRlbnRTaXplICs9ICRDaHVua1NpemUNCiAgICAgICAgICAgICAgICAgICAgJFRleHRDaHVua1N0ckluZGV4ICs9ICRDaHVua1NpemUNCiAgICAgICAgICAgICAgICAgICAgY29udGludWUNCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICAgICAgIyBJZiB0aGUgY3VycmVudCBjaHVuayBkb2Vzbid0IGZpdCBpbiB0aGUgY3VycmVudCBsaW5lDQogICAgICAgICAgICAgICAgJG5ld0NvbnRlbnQgPSAkVGV4dENodW5rLlN1YnN0cmluZygkVGV4dENodW5rU3RySW5kZXgsICRXaW5TaXplLSRDdXJybGluZS5jb250ZW50U2l6ZSkNCiAgICAgICAgICAgICAgICAkQ3VycmxpbmUuc3R5bGVkRGF0YSArPSAkbmV3Q29udGVudA0KICAgICAgICAgICAgICAgICRDdXJybGluZS5jb250ZW50U2l6ZSArPSAkbmV3Q29udGVudC5sZW5ndGgNCiAgICAgICAgICAgICAgICAkVGV4dENodW5rU3RySW5kZXggKz0gJG5ld0NvbnRlbnQubGVuZ3RoDQogICAgICAgICAgICAgICAgJiAkQ3VycmxpbmUubmV4dA0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIGlmICgkQ3VycmxpbmUuY29udGVudFNpemUgLWd0IDApIHsNCiAgICAgICAgICAgIGlmICgkQ3VycmxpbmUuY29udGVudFNpemUpew0KICAgICAgICAgICAgICAgIEFsaWduLVRleHQgLUFsaWduICRBbGlnbiAtVGV4dCAkQ3VycmxpbmUuc3R5bGVkRGF0YSAtQ29sb3JDb2Rlc0Rpc2NyZXRlUGVyTGluZTokQ29sb3JDb2Rlc0Rpc2NyZXRlUGVyTGluZSB8ID8geyRffSB8ICUgew0KICAgICAgICAgICAgICAgICAgICAkQ3VycmxpbmUuZmluYWxMaW5lcyArPSAsJF8NCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgICRDdXJybGluZS5maW5hbExpbmVzWy0xXSArPSAkQ3VycmxpbmUuc3R5bGVkRGF0YQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQogICAgICAgIHJldHVybiAmICRGaW5hbEZvcm1hdHRlciAkQ3VycmxpbmUuZmluYWxMaW5lcyAkUnVubmluZ1N0eWxlcw0KICAgICAgICByZXR1cm4gJEN1cnJsaW5lLmZpbmFsTGluZXMNCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtT1Mgew0KICAgIGlmICgkUFNWZXJzaW9uVGFibGUuUFNFZGl0aW9uIC1lcSAnQ29yZScpIHsNCiAgICAgICAgaWYgKCRJc1dpbmRvd3MpIHtyZXR1cm4gJ1dpbmRvd3MnfQ0KICAgICAgICBlbHNlaWYgKCRJc0xpbnV4KSB7cmV0dXJuICdMaW51eCd9DQogICAgICAgIGVsc2VpZiAoJElzTWFjT1MpIHtyZXR1cm4gJ01hY09TJ30NCiAgICB9IGVsc2Uge3JldHVybiAnV2luZG93cyd9DQp9CgpmdW5jdGlvbiBJbnZva2UtT3JSZXR1cm4ge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlLCBWYWx1ZUZyb21QaXBlbGluZT0kdHJ1ZSwgUG9zaXRpb249MCldW0FsbG93TnVsbCgpXSRDb2RlLCBbUGFyYW1ldGVyKFZhbHVlRnJvbVJlbWFpbmluZ0FyZ3VtZW50cz0xKV0kX19SZXN0LCBbU3dpdGNoXSRBc1Byb2Nlc3NCbG9jaykNCg0KICAgIGlmICghKCRDb2RlIC1pcyBbU2NyaXB0QmxvY2tdKSkge3JldHVybiAkQ29kZX0NCiAgICBpZiAoISRBc1Byb2Nlc3NCbG9jaykge3JldHVybiAmICRDb2RlIEBfX1Jlc3R9DQogICAgcmV0dXJuICUgLXByb2Nlc3MgJENvZGUgLUlucHV0T2JqZWN0ICRfX1Jlc3QNCn0KCmZ1bmN0aW9uIEludm9rZS1UZXJuYXJ5IHtwYXJhbSgkZGVjaWRlciwgJGlmdHJ1ZSwgJGlmZmFsc2UgPSB7fSkNCg0KICAgICRJbnZva2VPclJldHVybiA9IHsNCiAgICAgICAgcGFyYW0oJENtZCkNCiAgICAgICAgaWYgKCRDbWQgLWlzIFtTY3JpcHRCbG9ja10pIHsmICRDbWR9IGVsc2UgeyRDbWR9DQogICAgfQ0KICAgIGlmICgkZGVjaWRlcikgeyYgJEludm9rZU9yUmV0dXJuICRpZnRydWV9IGVsc2UgeyYgJEludm9rZU9yUmV0dXJuICRpZmZhbHNlfQ0KfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bQXJndW1lbnRDb21wbGV0ZXIoew0KICAgIFtPdXRwdXRUeXBlKFtTeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLkNvbXBsZXRpb25SZXN1bHRdKV0NCiAgICBwYXJhbSgNCiAgICAgICAgW3N0cmluZ10gJENvbW1hbmROYW1lLA0KICAgICAgICBbc3RyaW5nXSAkUGFyYW1ldGVyTmFtZSwNCiAgICAgICAgW3N0cmluZ10gJFdvcmRUb0NvbXBsZXRlLA0KICAgICAgICBbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5MYW5ndWFnZS5Db21tYW5kQXN0XSAkQ29tbWFuZEFzdCwNCiAgICAgICAgW1N5c3RlbS5Db2xsZWN0aW9ucy5JRGljdGlvbmFyeV0gJEZha2VCb3VuZFBhcmFtZXRlcnMNCiAgICApDQogICAgJENvbXBsZXRpb25SZXN1bHRzID0gW1N5c3RlbS5Db2xsZWN0aW9ucy5HZW5lcmljLkxpc3RbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XV06Om5ldygpDQogICAgJExpYiA9IEAoIkludGVybmV0Iiwib3M6d2luZG93cyIsIm9zOm1hYyIsIm9zOmxpbnV4Iiwib3M6dW5peCIsImFkbWluaXN0cmF0b3IiLCJyb290IiwiZGVwOiIsImxpYjoiLCJsaWJfdGVzdDoiLCJtb2R1bGU6IiwibW9kdWxlX3Rlc3Q6IiwiZnVuY3Rpb246Iiwic3RyaWN0X2Z1bmN0aW9uOiIsImFiaWxpdHk6ZXNjYXBlX2NvZGVzIiwiYWJpbGl0eTplbW9qaXMiLCJhYmlsaXR5Om5lcmRfZm9udCIsImFiaWxpdHk6bG9uZ19wYXRocyIsImFiaWxpdHk6Y29uc29sZV9tYW5pcHVsYXRpb24iKQ0KICAgICRqc09yID0ge2ZvcmVhY2ggKCRhIGluICRhcmdzKSB7JGEgPSAkKGlmKCRhIC1pcyBbc2NyaXB0YmxvY2tdKXsmJGF9ZWxzZXskYX0pO2lmICghJGEpe2NvbnRpbnVlfTtyZXR1cm4gJGF9O3JldHVybiAkYX0gIyBNYW51YWxseSBlbWJlZGRlZCBKUy1PUg0KICAgICYgJGpzT3IgeyRMaWIgfCA/IHskXyAtbGlrZSAiJFdvcmRUb0NvbXBsZXRlKiJ9fSB7JExpYiB8ID8geyRfIC1saWtlICIqJFdvcmRUb0NvbXBsZXRlKiJ9fSB8ICUgew0KICAgICAgICAkQ29tcGxldGlvblJlc3VsdHMuQWRkKFtTeXN0ZW0uTWFuYWdlbWVudC5BdXRvbWF0aW9uLkNvbXBsZXRpb25SZXN1bHRdOjpuZXcoJF8sICRfLCAnUGFyYW1ldGVyVmFsdWUnLCAkXykpDQogICAgfQ0KICAgIHJldHVybiAkQ29tcGxldGlvblJlc3VsdHMNCn0pXVtTdHJpbmddJExpYiwgW1NjcmlwdEJsb2NrXSRPbkZhaWwsIFtTd2l0Y2hdJFBhc3NUaHJ1KQ0KDQogICAgJExvYWRNb2R1bGUgPSB7DQogICAgICAgIHBhcmFtKCRGaWxlLFtib29sXSRJbXBvcnQpDQogICAgICAgIHRyeSB7SW1wb3J0LU1vZHVsZSAkRmlsZSAtZWEgc3RvcDtyZXR1cm4gMX0gY2F0Y2gge30NCiAgICAgICAgJExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyRMRiA9ICIkTGliXCRGaWxlIg0KICAgICAgICAkZiA9ICRMRiwiJExGLnBzbTEiLCIkTEYuZGxsIiB8ID8ge3Rlc3QtcGF0aCAtdCBsZWFmICRffSB8IHNlbGVjdCAtZiAxDQogICAgICAgIGlmICgkZiAtYW5kICRJbXBvcnQpIHsNCiAgICAgICAgICAgIEltcG9ydC1Nb2R1bGUgJGYNCiAgICAgICAgICAgIGlmICgkPykge3JldHVybiAkZn0gZWxzZSB7V3JpdGUtQVAgIiFGYWlsZWQgdG8gaW1wb3J0IFskRmlsZSAtPiAkRl0iO3JldHVybiAwfQ0KICAgICAgICB9DQogICAgICAgIHJldHVybiAkZg0KICAgIH0NCiAgICAkSW52b2tlT3JSZXR1cm4gPSB7cGFyYW0oJENtZCwgJGZhbGxiYWNrPTApIGlmICgkQ21kIC1pcyBbU2NyaXB0QmxvY2tdKSB7dHJ5eyYgJENtZH1jYXRjaHskZmFsbGJhY2t9fSBlbHNlIHskQ21kfX0NCiAgICBpZiAoISRPbkZhaWwpIHskUGFzc1RocnUgPSAkdHJ1ZX0NCiAgICAkU3RhdCA9ICQoc3dpdGNoIC1yZWdleCAoJExpYi50cmltKCkpIHsNCiAgICAgICAgIl5JbnRlcm5ldCQiICAgICAgICAgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQ0KICAgICAgICAiXmFkbWluKGlzdHJhdG9yKT8kfF5yb290JCIgICAgICAgIHtUZXN0LUFkbWluaXN0cmF0b3J9DQogICAgICAgICJeZGVwOiguKikkIiAgICAgICAgICAgICAgICAgICAgICAge0dldC1XaGVyZSAkTWF0Y2hlc1sxXX0NCiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSQiICAgICAgICAgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9DQogICAgICAgICJeKGxpYnxtb2R1bGUpX3Rlc3Q6KC4qKSQiICAgICAgICAgeyRMb2FkTW9kdWxlLmludm9rZSgkTWF0Y2hlc1syXSl9DQogICAgICAgICJeZnVuY3Rpb246KC4qKSQiICAgICAgICAgICAgICAgICAge2djbSAkTWF0Y2hlc1sxXSAtZWEgU2lsZW50bHlDb250aW51ZX0NCiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSQiICAgICAgICAgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQ0KICAgICAgICAiXm9zOih3aW4oZG93cyk/fGxpbnV4fG1hY3x1bml4KSQiIHskbyA9IEdldC1PUzskSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCI7c3dpdGNoIC1yZWdleCAoJE1hdGNoZXNbMV0pIHsNCiAgICAgICAgICAgICJed2luIiAgIHtyZXR1cm4gJG8gLWVxICJXaW5kb3dzIn0NCiAgICAgICAgICAgICJsaW51eCIgIHtyZXR1cm4gJG8gLWVxICJMaW51eCJ9DQogICAgICAgICAgICAibWFjIiAgICB7cmV0dXJuICRvIC1lcSAiTWFjT1MifQ0KICAgICAgICAgICAgInVuaXgiICAge3JldHVybiAkSXNVbml4fQ0KICAgICAgICB9fQ0KICAgICAgICAiXmFiaWxpdHk6KC4rKSQiICAgICB7JG0gPSAkTWF0Y2hlc1sxXTtKUy1OQ1EgKCYgJEludm9rZU9yUmV0dXJuIChAew0KICAgICAgICAgICAgZXNjYXBlX2NvZGVzID0gJEhvc3QuVUkuU3VwcG9ydHNWaXJ0dWFsVGVybWluYWwNCiAgICAgICAgICAgIGVtb2ppcyA9ICRlbnY6V1RfU0VTU0lPTiAtb3IgJGVudjpXVF9QUk9GSUxFX0lEIC1vciAoJGVudjpURVJNX1BST0dSQU0gLW1hdGNoICd2c2NvZGV8aVRlcm0uYXBwfEFwcGxlX1Rlcm1pbmFsJykNCiAgICAgICAgICAgIG5lcmRfZm9udCA9IHskcD0kSG9zdC5VSS5SYXdVSS5DdXJzb3JQb3NpdGlvbjtXcml0ZS1Ib3N0IC1Ob05ld2xpbmUgKFtjaGFyXTo6Q29udmVydEZyb21VdGYzMigweEYwNTMxKSk7JG49JEhvc3QuVUkuUmF3VUkuQ3Vyc29yUG9zaXRpb247JEhvc3QuVUkuUmF3VUkuQ3Vyc29yUG9zaXRpb249JHA7V3JpdGUtSG9zdCAtTm9OZXdsaW5lICcgICc7JEhvc3QuVUkuUmF3VUkuQ3Vyc29yUG9zaXRpb249JHA7KCRuLlgtJHAuWCktZXEgMX0NCiAgICAgICAgICAgIGxvbmdfcGF0aHMgPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IiAtb3IgKEdldC1JdGVtUHJvcGVydHkgLVBhdGggIkhLTE06XFNZU1RFTVxDdXJyZW50Q29udHJvbFNldFxDb250cm9sXEZpbGVTeXN0ZW0iIHwgJSBsb25ncGF0aHNlbmFibGVkKQ0KICAgICAgICAgICAgY29uc29sZV9tYW5pcHVsYXRpb24gPSAhW1N5c3RlbS5Db25zb2xlXTo6SXNPdXRwdXRSZWRpcmVjdGVkIC1hbmQgKCRIb3N0Lk5hbWUgLWVxICdDb25zb2xlSG9zdCcpDQogICAgICAgIH1bJG1dKSkge1dyaXRlLUFQICIhUmVxdWlyZWQgYWJpbGl0eSBbJG1dIGlzIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBwbGF0Zm9ybS4iOyB0aHJvdyAnQkFEX1NFTEVDVE9SJ319DQogICAgICAgIGRlZmF1bHQge1dyaXRlLUFQICIhSW52YWxpZCBzZWxlY3RvciBwcm92aWRlZCBbJCgiJExpYiIuc3BsaXQoJzonKVswXSldIjt0aHJvdyAnQkFEX1NFTEVDVE9SJ30NCiAgICB9KQ0KICAgIGlmICghJFN0YXQgLWFuZCAkT25GYWlsKSB7JiAkT25GYWlsfQ0KICAgIGlmICgkUGFzc1RocnUgLW9yICEkT25GYWlsKSB7cmV0dXJuICRTdGF0fQ0KfQoKZnVuY3Rpb24gU2V0LVBhdGggew0KICAgIFtjbWRsZXRiaW5kaW5nKCldDQogICAgcGFyYW0oDQogICAgICAgIFtQYXJhbWV0ZXIoTWFuZGF0b3J5ID0gJHRydWUsIFZhbHVlRnJvbVBpcGVsaW5lID0gJHRydWUpXVtzdHJpbmdbXV0kUGF0aCwNCiAgICAgICAgW3N0cmluZ10kUGF0aFNlcCwNCiAgICAgICAgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIg0KICAgICkNCiAgICBiZWdpbiB7DQogICAgICAgIFtzdHJpbmdbXV0kRmluYWxQYXRoID0gQCgpDQogICAgICAgICRQYXRoU2VwID0gR2V0LVBhdGhWYXJTZXAgJFBhdGhTZXANCiAgICB9DQogICAgcHJvY2VzcyB7DQogICAgICAgICRQYXRoIHwgJSB7DQogICAgICAgICAgICAkRmluYWxQYXRoICs9ICRfDQogICAgICAgIH0NCiAgICB9DQogICAgZW5kIHsNCiAgICAgICAgJFB0aCA9ICRGaW5hbFBhdGggLWpvaW4gJFBhdGhTZXANCiAgICAgICAgJFB0aCA9ICgkUHRoIC1yZXBsYWNlKCIkUGF0aFNlcCsiLCAkUGF0aFNlcCkgLXJlcGxhY2UoIlxcJFBhdGhTZXB8XFwkIiwgJFBhdGhTZXApKS50cmltKCRQYXRoU2VwKQ0KICAgICAgICAkUHRoID0gKCgkUHRoKS5zcGxpdCgkUGF0aFNlcCkgfCBzZWxlY3QgLXVuaXF1ZSkgLWpvaW4gJFBhdGhTZXANCiAgICAgICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkNCiAgICB9DQp9CgpmdW5jdGlvbiBHZXQtUGF0aCB7cGFyYW0oJG1hdGNoLCBbc3RyaW5nXSRQYXRoVmFyID0gIlBBVEgiLCBbc3RyaW5nXSRQYXRoU2VwID0gIiIpDQoNCiAgICAkUHRoID0gW0Vudmlyb25tZW50XTo6R2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhcikNCiAgICAkUGF0aFNlcCA9IEdldC1QYXRoVmFyU2VwICRQYXRoU2VwDQogICAgaWYgKCEkUHRoKSB7cmV0dXJuIEAoKX0NCiAgICBTZXQtUGF0aCAkUHRoIC1QYXRoVmFyICRQYXRoVmFyIC1QYXRoU2VwICRQYXRoU2VwDQogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApDQogICAgaWYgKCRtYXRjaCkgeyRkIC1tYXRjaCAkbWF0Y2h9IGVsc2UgeyRkfQ0KfQoKZnVuY3Rpb24gSlMtTkNRIHtmb3JlYWNoICgkYSBpbiAkYXJncykgeyRyID0gSW52b2tlLU9yUmV0dXJuICRhO2lmICgkbnVsbCAtbmUgJHIpIHtyZXR1cm4gJHJ9fTtyZXR1cm4gJHJ9CgpmdW5jdGlvbiBGbGF0dGVuIHtwYXJhbShbb2JqZWN0W11dJHgpDQoNCiAgICBpZiAoISgkWCAtaXMgW2FycmF5XSkpIHtyZXR1cm4gJHh9DQogICAgaWYgKCRYLmNvdW50IC1lcSAxKSB7DQogICAgICAgIHJldHVybiAkeCB8ICUgeyRffQ0KICAgIH0NCiAgICAkeCB8ICUge0ZsYXR0ZW4gJF99DQp9CgpmdW5jdGlvbiBHZXQtRXNjYXBlIHsNCiAgICBpZiAoJG51bGwgLWVxICRBUF9DT05TT0xFLmN1c3RvbUZsYWdzLl9fZGV0ZWN0ZWRfZXNjYXBlX2NvZGVzKSB7JEFQX0NPTlNPTEUuY3VzdG9tRmxhZ3MuX19kZXRlY3RlZF9lc2NhcGVfY29kZXMgPSBBUC1SZXF1aXJlICJhYmlsaXR5OmVzY2FwZV9jb2RlcyJ9DQogICAgaWYgKCEkQVBfQ09OU09MRS5jdXN0b21GbGFncy5fX2RldGVjdGVkX2VzY2FwZV9jb2RlcyAtYW5kICEkQVBfQ09OU09MRS5jdXN0b21GbGFncy5mb3JjZVVuaXhFc2NhcGVzKSB7dGhyb3cgIltBUENvbnNvbGU6OkdldC1Fc2NhcGVdIFlvdXIgY29uc29sZSBkb2VzIG5vdCBzdXBwb3J0IEFOU0kgZXNjYXBlIGNvZGVzLiBZb3UgY2FuIHNldCBgJEFQX0NPTlNPTEUuY3VzdG9tRmxhZ3Mubm9Vbml4RXNjYXBlcyA9IGAkdHJ1ZSB0byBkaXNhYmxlIHVuaXggZXNjYXBlIGNvZGVzLiBPciwgdXNlOiBgJEFQX0NPTlNPTEUuY3VzdG9tRmxhZ3MuZm9yY2VVbml4RXNjYXBlcyB0byBhdHRlbXB0IGl0IGFueXdheXMifQ0KICAgICMgV2UgZG8gdGhpcywgYmVjYXVzZSBQb3dlclNoZWxsIE5hdGl2ZSBkb2Vzbid0IGtub3cgYGUNCiAgICByZXR1cm4gW0NoYXJdMHgxYiAjIGBlDQp9CgpmdW5jdGlvbiBQbGFjZS1CdWZmZXJlZENvbnRlbnQge3BhcmFtKCRUZXh0LCAkeCwgJHksIFtDb25zb2xlQ29sb3JdJEZvcmVncm91bmRDb2xvcj1bQ29uc29sZV06OkZvcmVncm91bmRDb2xvciwgW0NvbnNvbGVDb2xvcl0kQmFja2dyb3VuZENvbG9yPVtDb25zb2xlXTo6QmFja2dyb3VuZENvbG9yKQ0KDQogICAgaWYgKCEkVGV4dCkge3JldHVybn0NCiAgICAkY3JkID0gW01hbmFnZW1lbnQuQXV0b21hdGlvbi5Ib3N0LkNvb3JkaW5hdGVzXTo6bmV3KCR4LCR5KQ0KICAgICRiID0gJEhvc3QuVUkuUmF3VUkNCiAgICAkYXJyID0gJGIuTmV3QnVmZmVyQ2VsbEFycmF5KEAoJFRleHQpLCAkRm9yZWdyb3VuZENvbG9yLCAkQmFja2dyb3VuZENvbG9yKQ0KICAgICR4ID0gW0NvbnNvbGVdOjpCdWZmZXJXaWR0aC0xLSRUZXh0Lmxlbmd0aA0KICAgICRiLlNldEJ1ZmZlckNvbnRlbnRzKCRjcmQsICRhcnIpDQp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHsNCiAgICBbQ21kbGV0QmluZGluZygpXXBhcmFtKFtQYXJhbWV0ZXIoVmFsdWVGcm9tUGlwZWxpbmU9MSldJFN0cikNCiAgICBwcm9jZXNzIHskU3RyIHwgJSB7JF8gLXJlcGxhY2UgIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyhcO1xkKykqbSIsIiJ9fQ0KfQoKZnVuY3Rpb24gU2l6ZS1BZGoge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSR0cnVlKV1bRG91YmxlXSRCeXRlcywgW1N3aXRjaF0kQnlUaG91c2FuZCkNCg0KICAgICRCVCA9ID86KCRCeVRob3VzYW5kKXsxMDAwfXsxMDI0fQ0KICAgICRTaXplcyA9IEAoIiIsIksiLCJNIiwiRyIsIlQiLCJQIiwiRSIsIloiLCJZIikNCiAgICAkRGVnID0gW01hdGhdOjpGbG9vcihbTWF0aF06OkxvZygkYnl0ZXMsJEJUKSkNCiAgICAkRGVnID0gPzooJERlZyAtZ2UgJFNpemVzLmNvdW50KXskU2l6ZXMuY291bnQtMX17JERlZ30NCiAgICAkUmV0ID0gInswfSIgLWYgW01hdGhdOjpSb3VuZCgkQnl0ZXMvKFtNYXRoXTo6UG93KCRCVCwkRGVnKSksMikNCiAgICBpZiAoJHJldCAtZXEgIk5hTiIpIHtyZXR1cm4gJHJldH0NCiAgICBSZXR1cm4gIiRyZXQgJCgkU2l6ZXNbJERlZ10pQiINCn0KCmZ1bmN0aW9uIEpTLU9SIHtmb3JlYWNoICgkYSBpbiAkYXJncykgeyRyID0gSW52b2tlLU9yUmV0dXJuICRhO2lmICghJHIpe2NvbnRpbnVlfTtyZXR1cm4gJHJ9O3JldHVybiAkcn0KCmZ1bmN0aW9uIFRlc3QtQWRtaW5pc3RyYXRvciB7DQogICAgaWYgKCRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiKSB7DQogICAgICAgIGlmICgkKHdob2FtaSkgLWVxICJyb290Iikgew0KICAgICAgICAgICAgcmV0dXJuICR0cnVlDQogICAgICAgIH0NCiAgICAgICAgZWxzZSB7DQogICAgICAgICAgICByZXR1cm4gJGZhbHNlDQogICAgICAgIH0NCiAgICB9DQogICAgIyBXaW5kb3dzDQogICAgKE5ldy1PYmplY3QgU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NQcmluY2lwYWwgKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKSkuSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRpblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KfQoKU2V0LUFsaWFzIHdoaWNoIEdldC1XaGVyZQpTZXQtQWxpYXMgPzogSW52b2tlLVRlcm5hcnk=")
} elseif($AP_CONSOLE.warnOnCompileRun) {& $AP_CONSOLE.warnOnCompileRun}
# ========================================END=OF=COMPILER=================================================================|
$Global:AP_Games = [PSCustomObject]@{
    Minecraft = @{
        Launchers = @{
            Vanilla = 'D:\Games\Minecraft-Games\Minecraft-Launcher\MinecraftLauncher.exe'
            Tekkit = '~\Desktop\TechnicLauncher.exe'
        }
        Single = @{
            RLCraft = 'D:\Games\Minecraft-Games\Tekkit\modpacks\shivaxi-rlcraft\saves\AP'
            TekkitMain = 'D:\Games\Minecraft-Games\Tekkit\modpacks\tekkitmain\saves\AP-New'
            Vanilla = 'D:\Games\Minecraft-Games\Tekkit\modpacks\vanilla\saves\AP'
        }
        Servers = @{
            RLCraft = 'D:\Games\Minecraft-Games\RLCraft-Server-1.12.2-v2.8.2\forge-1.12.2-14.23.5.2847-universal.jar'
            Vanilla = 'D:\Games\Minecraft-Games\Tekkit\modpacks\vanilla\server\forge-1.16.2-33.0.5.jar'
        }
    }
    SubnauticaMP = 'D:\Games\Subnautica-MultiPlayer'
    Subnautica = 'D:\AP-Progs\Steam\steamapps\common\SubnauticaZero'
}

function Link-SteamLoader($Path = "D:\AP-Progs\Steam\steamapps\common\") {
    $Apps = (ls "$Path" -Dir) -join ","

    iex "function global:steam([ValidateSet($Apps)]`$App) {
        start steam://something
    }"
    Write-AP "+Use steam <app> to launch portable apps!"
}
function global:__world-backup {
    param(
        [Parameter(Mandatory=$true, Position = 0)][string]$GameName,
        [string]$WorldPath = '.\world',
        [string]$BackupFolder = '.\ap.bkps',
        [string]$BackupName,
        [switch]$List,
        [switch]$SkipSizeCalc
    )
    if (!(Test-Path $WorldPath)) {return Write-AP "-Backup folder for $GameName does not exist [$WorldPath]"}
    if ($List) {
        ls -dir $BackupFolder | % {
            $s = ls -R $_.FullName | % Length | measure -Sum | % sum
            [Pscustomobject]@{Name=$_.name;Size=(Size-Adj $s)}
        }
        return
    }
    $Prefix = Split-Path -Leaf $WorldPath
    if (!$BackupName) {
        $BackupName = "$GameName-$Prefix-$((Get-Date).ToString("yy-MM-dd_HH"))"
    }
    $FinalBkp = Join-Path $BackupFolder $BackupName
    md -ea SilentlyContinue $FinalBkp | Out-Null
    Write-AP "x*Backing up $GameName - Save ","n!$Prefix"
    Write-AP "x>*Path: ","n#$(Resolve-Path $FinalBkp)"
    cp -R -Force "$WorldPath\*" $FinalBkp
    if ($SkipSizeCalc) {return Write-AP ">+Done!"}
    $ss = ls -R $FinalBkp -File | % Length | Measure -sum | % sum
    Write-AP ">+Done! (Size: $(Size-Adj $ss))"
}
function global:minecraft {
    [CmdletBinding(DefaultParameterSetName = 'launch')]
    param(
        [Parameter(Mandatory=$true, Position = 0)][ArgumentCompleter({param($a,$b,$WordToComplete)@($AP_Games.Minecraft.Single.Keys) | ? {$_ -match "^$WordToComplete"}})]$Name,
        [Parameter(ParameterSetName = 'cd')][switch]$cd,
        [Parameter(ParameterSetName = 'open')][switch]$Open,
        [Parameter(ParameterSetName = 'backup')][switch]$Backup
    )
    if ($cd) {return pushd $AP_Games.Minecraft.Single.$Name}
    if ($open) {return explorer $AP_Games.Minecraft.Single.$Name}
    if ($backup) {
        if ($Name -eq 'Vanilla') {return Write-AP "!Cannot backup vanilla world as AP does not know where those files are actually saved!"}
        return __world-backup -GameName $Name -WorldPath $AP_Games.Minecraft.Single.$Name -BackupFolder "$($AP_Games.Minecraft.Single.$Name)\..\..\ap.bkps"
    }
    # Launch Game otherwise
    if ($Name -eq 'Vanilla') {return & $AP_Games.Minecraft.Launchers.Vanilla}
    & $AP_Games.Minecraft.Launchers.Tekkit
}
function global:minecraft-server {
    [CmdletBinding(DefaultParameterSetName = 'launch')]
    param(
        [Parameter(Mandatory=$true, Position = 0)][ArgumentCompleter({param($a,$b,$WordToComplete)@($AP_Games.Minecraft.Servers.Keys) | ? {$_ -match "^$WordToComplete"}})]$Name,
        [Parameter(ParameterSetName = 'cd')][switch]$cd,
        [Parameter(ParameterSetName = 'open')][switch]$Open,
        [Parameter(ParameterSetName = 'backup')][switch]$Backup,
        [Parameter(ParameterSetName = 'launch')][switch]$NewShell,
        [Parameter(ParameterSetName = 'launch')][int]$Mem=4
    )
    $JarFile = $AP_Games.Minecraft.Servers.$Name
    $Folder = Split-Path $JarFile
    $JarFile = Split-Path -Leaf $JarFile
    if ($cd) {return pushd $Folder}
    if ($open) {return explorer $Folder}
    if ($backup) {
        return __world-backup -GameName $Name -WorldPath "$Folder\World" -BackupFolder "$Folder\ap.bkps"
    }
    # Launch Game otherwise
    if (!(AP-Require "dep:java" -PassThru)) {return Write-AP '-Java is required by the minecraft to run'}
    Write-AP "+Launching $Name Server - ${Mem}GB"
    Write-AP ">*Jar File: $JarFile"
    $MemSize = $Mem * 1024
    $Arg = "-Xmx${MemSize}M -Xms${MemSize}M -jar $JarFile nogui"
    pushd $Folder
    if ($NewShell) {start java.exe $Arg}
    else {iex "java.exe $Arg"}
    popd
}

function global:subnautica {
    [CmdletBinding(DefaultParameterSetName = 'launch')]
    param(
        [Parameter(ParameterSetName = 'install', Mandatory = $true, Position = 0)][string]$InstallMod,
        [Parameter(ParameterSetName = 'install', Position = 1)][switch]$DontDeleteInstaller,
        [Parameter(ParameterSetName = 'cd')][switch]$cd,
        [Parameter(ParameterSetName = 'open')][switch]$Open,
        [Parameter(ParameterSetName = 'backup')][switch]$Backup,
        [Parameter(ParameterSetName = 'listbkps')][switch]$ListBkps
    )
    if ($ListBkps) {
        return __world-backup -GameName 'Subnautica' -WorldPath "$($AP_Games.Subnautica)\SNAppData" -BackupFolder "$($AP_Games.Subnautica)\ap.bkps" -List
    }
    if ($Backup) {
        return __world-backup -GameName 'Subnautica' -WorldPath "$($AP_Games.Subnautica)\SNAppData" -BackupFolder "$($AP_Games.Subnautica)\ap.bkps"
    }
    if ($Open) {return explorer $AP_Games.Subnautica}
    pushd $AP_Games.Subnautica
    if ($Cd) {return}
    if ($InstallMod) {
        if ($InstallMod -notmatch "\.zip$") {Write-AP "!This Path is not a zip file [$InstallMod]";return popd}
        if (!(Test-Path $InstallMod)) {Write-AP "!This zip file doesn't exist [$InstallMod]";return popd}
        if (!(AP-Require -PassThru "dep:7z")) {Write-AP "!7-Zip not found in path, cannot continue with installation";return popd}
        if (!(Test-Path '.\QMods')) {Write-AP "!Your subnautica instance is not yet ready for modding. Go to: https://www.reddit.com/r/subnautica/comments/9b9847/a_quick_and_dirty_guide_to_mods/";return popd}
        $ModName = Split-Path -leaf $InstallMod
        Write-AP "*Installing from [$ModName]"
        7z x $InstallMod -oQMods/ 2>&1 | % {Write-AP ">#$_"}
        if (!$?) {Write-AP ">!Something went wrong, sorry";return popd}
        $ModSize = ls $InstallMod | % length
        Write-AP "+Successfully installed mod [$ModName] ($(Size-Adj $ModSize))"
        if (!$DontDeleteInstaller) {
            Write-AP ">*Cleaning Installer"
            rm $InstallMod
        }
    } else {
        $Exe = Split-Path -Leaf $AP_Games.Subnautica
        Write-AP "+Launching $Exe"
        & ".\$Exe.exe"
    }
    popd
}
function global:subnautica-multiplayer([switch]$Folder, [switch]$Backup) {
    if ($Backup) {
        #TODO(AP): Implement the __world-backup function here instead and make single entrypoint for Subnautica
        pushd $AP_Games.SubnauticaMP
        if ($Sizes) {.\ap.scripts\sizes.ps1}
        else {.\backup.bat}
        popd
        return
    }
    if ($Folder) {return explorer $AP_Games.SubnauticaMP}
    pushd $AP_Games.Subnautica
    .\NitroxLauncher.exe
    popd
}
sal -sc Global subnautica-mp subnautica-multiplayer
Write-AP "+Configured Game-Linking [Tekkit, Minecraft, Subnautica] for AP-Console"

