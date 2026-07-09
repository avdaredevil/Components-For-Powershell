# =======================================START=OF=COMPILER================================================================|
#    The Following Code was added by AP-Compiler 1.6 (APC: 1.3) To Make this program independent of AP-Core Engine
#    GitHub: https://github.com/avdaredevil/AP-Compiler
# ========================================================================================================================|
$Script:PSHell=$(if($PSHell){$PSHell}elseif($PSScriptRoot){$PSScriptRoot}else{"."});
if($AP_CONSOLE.mode -ne 'main' -or $AP_CONSOLE.customFlags.runAsCompiled) {
    $Script:AP_CONSOLE = [PsCustomObject]@{version=[version]'1.3'; mode = 'shim'; customFlags = @{}}
    function B64 {param([Parameter(ValueFromPipeline=$true)][String]$Text, [ValidateSet("UTF8","Unicode")][String]$Encoding = "UTF8")     [System.Text.Encoding]::$Encoding.GetString([System.Convert]::FromBase64String($Text))}
    # This syntax is to prevent AV's from misclassifying this as anything but innocuous
    & (Get-Alias iex) (B64 "ZnVuY3Rpb24gQVAtQ29udmVydFBhdGgge3BhcmFtKFtQYXJhbWV0ZXIoTWFuZGF0b3J5PSRUcnVlKV1bU3RyaW5nXSRQYXRoKQ0KCiAgICAkUGF0aFNlcCA9IFtJTy5QYXRoXTo6RGlyZWN0b3J5U2VwYXJhdG9yQ2hhcgogICAgcmV0dXJuICRQYXRoIC1yZXBsYWNlCiAgICAgICAgIjxEZXA+IiwiPExpYj4ke1BhdGhTZXB9RGVwZW5kZW5jaWVzIiAtcmVwbGFjZQogICAgICAgICI8TGliPiIsIjxIb21lPiR7UGF0aFNlcH1BUC1MaWJyYXJpZXMiIC1yZXBsYWNlCiAgICAgICAgIjxDb21wKG9uZW50cyk/PiIsIjxIb21lPiR7UGF0aFNlcH1BUC1Db21wb25lbnRzIiAtcmVwbGFjZQogICAgICAgICI8SG9tZT4iLCRQU0hlbGx9CgpmdW5jdGlvbiBTZXQtUGF0aCB7CiAgICBbY21kbGV0YmluZGluZygpXQogICAgcGFyYW0oCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnkgPSAkdHJ1ZSwgVmFsdWVGcm9tUGlwZWxpbmUgPSAkdHJ1ZSldW3N0cmluZ1tdXSRQYXRoLAogICAgICAgIFtzdHJpbmddJFBhdGhTZXAsCiAgICAgICAgW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIgogICAgKQogICAgYmVnaW4gewogICAgICAgIFtzdHJpbmdbXV0kRmluYWxQYXRoID0gQCgpCiAgICAgICAgJFBhdGhTZXAgPSBHZXQtUGF0aFZhclNlcCAkUGF0aFNlcAogICAgfQogICAgcHJvY2VzcyB7CiAgICAgICAgJFBhdGggfCAlIHsKICAgICAgICAgICAgJEZpbmFsUGF0aCArPSAkXwogICAgICAgIH0KICAgIH0KICAgIGVuZCB7CiAgICAgICAgJFB0aCA9ICRGaW5hbFBhdGggLWpvaW4gJFBhdGhTZXAKICAgICAgICAkUHRoID0gKCRQdGggLXJlcGxhY2UoIiRQYXRoU2VwKyIsICRQYXRoU2VwKSAtcmVwbGFjZSgiXFwkUGF0aFNlcHxcXCQiLCAkUGF0aFNlcCkpLnRyaW0oJFBhdGhTZXApCiAgICAgICAgJFB0aCA9ICgoJFB0aCkuc3BsaXQoJFBhdGhTZXApIHwgc2VsZWN0IC11bmlxdWUpIC1qb2luICRQYXRoU2VwCiAgICAgICAgW0Vudmlyb25tZW50XTo6U2V0RW52aXJvbm1lbnRWYXJpYWJsZSgkUGF0aFZhciwgJFB0aCkKICAgIH0KfQoKZnVuY3Rpb24gUHJvY2Vzcy1Vbmljb2RlIHsKICAgICRGaW5hbEFyZ3MgPSBGbGF0dGVuICRhcmdzCiAgICAjIFBvd2VyU2hlbGwgQ29yZSBzeW50YXggd2hlbiBwcm9jZXNzZWQgYnkgUG93ZXJTaGVsbCBOYXRpdmUKICAgIGlmICgiJEZpbmFsQXJncyIgLW1hdGNoICJ1eyhcdyspfSIpIHtyZXR1cm4gW1JlZ2V4XTo6VW5lc2NhcGUoKCIkRmluYWxBcmdzIiAtcmVwbGFjZSAidXsoXHcrKX0iLCdcdSQxJykpfQogICAgaWYgKCEoJEZpbmFsQXJncyB8ID8geyRfIC1pc25vdCBbaW50XX0pKSB7cmV0dXJuIFtjaGFyW11dJEZpbmFsQXJncyAtam9pbiAnJ30KICAgIHJldHVybiAkYXJncwp9CgpmdW5jdGlvbiBTdHJpcC1Db2xvckNvZGVzIHsKICAgIFtDbWRsZXRCaW5kaW5nKCldcGFyYW0oW1BhcmFtZXRlcihWYWx1ZUZyb21QaXBlbGluZT0xKV0kU3RyKQogICAgcHJvY2VzcyB7JFN0ciB8ICUgeyRfIC1yZXBsYWNlICIkKFtyZWdleF06OmVzY2FwZSgiJChHZXQtRXNjYXBlKVsiKSlcZCsoXDtcZCspKm0iLCIifX0KfQoKZnVuY3Rpb24gSW52b2tlLU9yUmV0dXJuIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSwgVmFsdWVGcm9tUGlwZWxpbmU9JHRydWUsIFBvc2l0aW9uPTApXVtBbGxvd051bGwoKV0kQ29kZSwgW1BhcmFtZXRlcihWYWx1ZUZyb21SZW1haW5pbmdBcmd1bWVudHM9MSldJF9fUmVzdCwgW1N3aXRjaF0kQXNQcm9jZXNzQmxvY2spDQoKICAgIGlmICghKCRDb2RlIC1pcyBbU2NyaXB0QmxvY2tdKSkge3JldHVybiAkQ29kZX0KICAgIGlmICghJEFzUHJvY2Vzc0Jsb2NrKSB7cmV0dXJuICYgJENvZGUgQF9fUmVzdH0KICAgIHJldHVybiAlIC1wcm9jZXNzICRDb2RlIC1JbnB1dE9iamVjdCAkX19SZXN0Cn0KCmZ1bmN0aW9uIFNpemUtQWRqIHtwYXJhbShbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldW0RvdWJsZV0kQnl0ZXMsIFtTd2l0Y2hdJEJ5VGhvdXNhbmQpDQoKICAgICRCVCA9ID86KCRCeVRob3VzYW5kKXsxMDAwfXsxMDI0fQogICAgJFNpemVzID0gQCgiIiwiSyIsIk0iLCJHIiwiVCIsIlAiLCJFIiwiWiIsIlkiKQogICAgJERlZyA9IFtNYXRoXTo6Rmxvb3IoW01hdGhdOjpMb2coJGJ5dGVzLCRCVCkpCiAgICAkRGVnID0gPzooJERlZyAtZ2UgJFNpemVzLmNvdW50KXskU2l6ZXMuY291bnQtMX17JERlZ30KICAgICRSZXQgPSAiezB9IiAtZiBbTWF0aF06OlJvdW5kKCRCeXRlcy8oW01hdGhdOjpQb3coJEJULCREZWcpKSwyKQogICAgaWYgKCRyZXQgLWVxICJOYU4iKSB7cmV0dXJuICRyZXR9CiAgICBSZXR1cm4gIiRyZXQgJCgkU2l6ZXNbJERlZ10pQiIKfQoKZnVuY3Rpb24gQVAtUmVxdWlyZSB7cGFyYW0oW1BhcmFtZXRlcihNYW5kYXRvcnk9JFRydWUpXVtBbGlhcygiRnVuY3Rpb25hbGl0eSIsIkxpYnJhcnkiKV1bQXJndW1lbnRDb21wbGV0ZXIoewogICAgW091dHB1dFR5cGUoW1N5c3RlbS5NYW5hZ2VtZW50LkF1dG9tYXRpb24uQ29tcGxldGlvblJlc3VsdF0pXQogICAgcGFyYW0oCiAgICAgICAgW3N0cmluZ10gJENvbW1hbmROYW1lLAogICAgICAgIFtzdHJpbmddICRQYXJhbWV0ZXJOYW1lLAogICAgICAgIFtzdHJpbmddICRXb3JkVG9Db21wbGV0ZSwKICAgICAgICBbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5MYW5ndWFnZS5Db21tYW5kQXN0XSAkQ29tbWFuZEFzdCwKICAgICAgICBbU3lzdGVtLkNvbGxlY3Rpb25zLklEaWN0aW9uYXJ5XSAkRmFrZUJvdW5kUGFyYW1ldGVycwogICAgKQogICAgJENvbXBsZXRpb25SZXN1bHRzID0gW1N5c3RlbS5Db2xsZWN0aW9ucy5HZW5lcmljLkxpc3RbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XV06Om5ldygpCiAgICAkTGliID0gQCgiSW50ZXJuZXQiLCJvczp3aW5kb3dzIiwib3M6bWFjIiwib3M6bGludXgiLCJvczp1bml4IiwiYWRtaW5pc3RyYXRvciIsInJvb3QiLCJkZXA6IiwibGliOiIsImxpYl90ZXN0OiIsIm1vZHVsZToiLCJtb2R1bGVfdGVzdDoiLCJmdW5jdGlvbjoiLCJzdHJpY3RfZnVuY3Rpb246IiwiYWJpbGl0eTplc2NhcGVfY29kZXMiLCJhYmlsaXR5OmVtb2ppcyIsImFiaWxpdHk6bmVyZF9mb250IiwiYWJpbGl0eTpsb25nX3BhdGhzIiwiYWJpbGl0eTpjb25zb2xlX21hbmlwdWxhdGlvbiIpCiAgICAkanNPciA9IHtmb3JlYWNoICgkYSBpbiAkYXJncykgeyRhID0gJChpZiAoJGEgLWlzIFtzY3JpcHRibG9ja10peyYkYX1lbHNlIHskYX0pO2lmICghJGEpe2NvbnRpbnVlfTtyZXR1cm4gJGF9O3JldHVybiAkYX0gIyBNYW51YWxseSBlbWJlZGRlZCBKUy1PUgogICAgJiAkanNPciB7JExpYiB8ID8geyRfIC1saWtlICIkV29yZFRvQ29tcGxldGUqIn19IHskTGliIHwgPyB7JF8gLWxpa2UgIiokV29yZFRvQ29tcGxldGUqIn19IHwgJSB7CiAgICAgICAgJENvbXBsZXRpb25SZXN1bHRzLkFkZChbU3lzdGVtLk1hbmFnZW1lbnQuQXV0b21hdGlvbi5Db21wbGV0aW9uUmVzdWx0XTo6bmV3KCRfLCAkXywgJ1BhcmFtZXRlclZhbHVlJywgJF8pKQogICAgfQogICAgcmV0dXJuICRDb21wbGV0aW9uUmVzdWx0cwp9KV1bU3RyaW5nXSRMaWIsIFtTY3JpcHRCbG9ja10kT25GYWlsLCBbU3dpdGNoXSRQYXNzVGhydSkNCgogICAgJExvYWRNb2R1bGUgPSB7CiAgICAgICAgcGFyYW0oJEZpbGUsW2Jvb2xdJEltcG9ydCkKICAgICAgICB0cnkge0ltcG9ydC1Nb2R1bGUgJEZpbGUgLWVhIHN0b3A7cmV0dXJuIDF9IGNhdGNoIHt9CiAgICAgICAgJExpYj1BUC1Db252ZXJ0UGF0aCAiPExJQj4iOyRMRiA9ICIkTGliXCRGaWxlIgogICAgICAgICRmID0gJExGLCIkTEYucHNtMSIsIiRMRi5kbGwiIHwgPyB7dGVzdC1wYXRoIC10IGxlYWYgJF99IHwgc2VsZWN0IC1mIDEKICAgICAgICBpZiAoJGYgLWFuZCAkSW1wb3J0KSB7CiAgICAgICAgICAgIEltcG9ydC1Nb2R1bGUgJGYKICAgICAgICAgICAgaWYgKCQ/KSB7cmV0dXJuICRmfSBlbHNlIHtXcml0ZS1BUCAiIUZhaWxlZCB0byBpbXBvcnQgWyRGaWxlIC0+ICRGXSI7cmV0dXJuIDB9CiAgICAgICAgfQogICAgICAgIHJldHVybiAkZgogICAgfQogICAgJEludm9rZU9yUmV0dXJuID0ge3BhcmFtKCRDbWQsICRmYWxsYmFjaz0wKSBpZiAoJENtZCAtaXMgW1NjcmlwdEJsb2NrXSkge3RyeSB7JiAkQ21kfWNhdGNoIHskZmFsbGJhY2t9fSBlbHNlIHskQ21kfX0KICAgIGlmICghJE9uRmFpbCkgeyRQYXNzVGhydSA9ICR0cnVlfQogICAgJFN0YXQgPSAkKHN3aXRjaCAtcmVnZXggKCRMaWIudHJpbSgpKSB7CiAgICAgICAgIl5JbnRlcm5ldCQiICAgICAgICAgICAgICAgICAgICAgICB7dGVzdC1jb25uZWN0aW9uIGdvb2dsZS5jb20gLUNvdW50IDEgLVF1aWV0fQogICAgICAgICJeYWRtaW4oaXN0cmF0b3IpPyR8XnJvb3QkIiAgICAgICAge1Rlc3QtQWRtaW5pc3RyYXRvcn0KICAgICAgICAiXmRlcDooLiopJCIgICAgICAgICAgICAgICAgICAgICAgIHtHZXQtV2hlcmUgJE1hdGNoZXNbMV19CiAgICAgICAgIl4obGlifG1vZHVsZSk6KC4qKSQiICAgICAgICAgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdLCAkdHJ1ZSl9CiAgICAgICAgIl4obGlifG1vZHVsZSlfdGVzdDooLiopJCIgICAgICAgICB7JExvYWRNb2R1bGUuaW52b2tlKCRNYXRjaGVzWzJdKX0KICAgICAgICAiXmZ1bmN0aW9uOiguKikkIiAgICAgICAgICAgICAgICAgIHtnY20gJE1hdGNoZXNbMV0gLWVhIFNpbGVudGx5Q29udGludWV9CiAgICAgICAgIl5zdHJpY3RfZnVuY3Rpb246KC4qKSQiICAgICAgICAgICB7VGVzdC1QYXRoICJGdW5jdGlvbjpcJCgkTWF0Y2hlc1sxXSkifQogICAgICAgICJeb3M6KHdpbihkb3dzKT98bGludXh8bWFjfHVuaXgpJCIgeyRvID0gR2V0LU9TOyRJc1VuaXggPSAkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4Ijtzd2l0Y2ggLXJlZ2V4ICgkTWF0Y2hlc1sxXSkgewogICAgICAgICAgICAjIGByZXR1cm5gIGluc2lkZSBhIG5lc3RlZCBzd2l0Y2ggZXhpdHMgdGhlIFdIT0xFIGZ1bmN0aW9uLCB3aGljaAogICAgICAgICAgICAjIGJ5cGFzc2VkIHRoZSBPbkZhaWwgaGFuZGxlciArIHRoZSBQYXNzVGhydSBnYXRlIGJlbG93LiBQcm9kdWNpbmcKICAgICAgICAgICAgIyB0aGUgdmFsdWUgZGlyZWN0bHkga2VlcHMgY29udHJvbCBpbiB0aGUgb3V0ZXIgc3dpdGNoIHNvIHRoZSByZXN0CiAgICAgICAgICAgICMgb2YgQVAtUmVxdWlyZSBydW5zIChmaXJlcyBPbkZhaWwgb24gZmFpbHVyZSwgc3VwcHJlc3NlcyByZXR1cm4KICAgICAgICAgICAgIyB3aGVuIE9uRmFpbCBpcyBzdXBwbGllZCB3aXRob3V0IFBhc3NUaHJ1KS4KICAgICAgICAgICAgIl53aW4iICAgeyRvIC1lcSAiV2luZG93cyI7IGJyZWFrfQogICAgICAgICAgICAibGludXgiICB7JG8gLWVxICJMaW51eCI7IGJyZWFrfQogICAgICAgICAgICAibWFjIiAgICB7JG8gLWVxICJNYWNPUyI7IGJyZWFrfQogICAgICAgICAgICAidW5peCIgICB7JElzVW5peDsgYnJlYWt9CiAgICAgICAgfX0KICAgICAgICAiXmFiaWxpdHk6KC4rKSQiICAgICB7JG0gPSAkTWF0Y2hlc1sxXTtKUy1OQ1EgKCYgJEludm9rZU9yUmV0dXJuIChAewogICAgICAgICAgICBlc2NhcGVfY29kZXMgPSAkSG9zdC5VSS5TdXBwb3J0c1ZpcnR1YWxUZXJtaW5hbAogICAgICAgICAgICBlbW9qaXMgPSAkZW52OldUX1NFU1NJT04gLW9yICRlbnY6V1RfUFJPRklMRV9JRCAtb3IgKCRlbnY6VEVSTV9QUk9HUkFNIC1tYXRjaCAndnNjb2RlfGlUZXJtLmFwcHxBcHBsZV9UZXJtaW5hbCcpCiAgICAgICAgICAgIG5lcmRfZm9udCA9IHskcD0kSG9zdC5VSS5SYXdVSS5DdXJzb3JQb3NpdGlvbjtXcml0ZS1Ib3N0IC1Ob05ld2xpbmUgKFtjaGFyXTo6Q29udmVydEZyb21VdGYzMigweEYwNTMxKSk7JG49JEhvc3QuVUkuUmF3VUkuQ3Vyc29yUG9zaXRpb247JEhvc3QuVUkuUmF3VUkuQ3Vyc29yUG9zaXRpb249JHA7V3JpdGUtSG9zdCAtTm9OZXdsaW5lICcgICc7JEhvc3QuVUkuUmF3VUkuQ3Vyc29yUG9zaXRpb249JHA7KCRuLlgtJHAuWCktZXEgMX0KICAgICAgICAgICAgbG9uZ19wYXRocyA9ICRQU1ZlcnNpb25UYWJsZS5QbGF0Zm9ybSAtZXEgIlVuaXgiIC1vciAoR2V0LUl0ZW1Qcm9wZXJ0eSAtUGF0aCAiSEtMTTpcU1lTVEVNXEN1cnJlbnRDb250cm9sU2V0XENvbnRyb2xcRmlsZVN5c3RlbSIgfCAlIGxvbmdwYXRoc2VuYWJsZWQpCiAgICAgICAgICAgIGNvbnNvbGVfbWFuaXB1bGF0aW9uID0gIVtTeXN0ZW0uQ29uc29sZV06OklzT3V0cHV0UmVkaXJlY3RlZCAtYW5kICgkSG9zdC5OYW1lIC1lcSAnQ29uc29sZUhvc3QnKQogICAgICAgIH1bJG1dKSkge1dyaXRlLUFQICIhUmVxdWlyZWQgYWJpbGl0eSBbJG1dIGlzIG5vdCBzdXBwb3J0ZWQgb24gdGhpcyBwbGF0Zm9ybS4iOyB0aHJvdyAnQkFEX1NFTEVDVE9SJ319CiAgICAgICAgZGVmYXVsdCB7V3JpdGUtQVAgIiFJbnZhbGlkIHNlbGVjdG9yIHByb3ZpZGVkIFskKCIkTGliIi5zcGxpdCgnOicpWzBdKV0iO3Rocm93ICdCQURfU0VMRUNUT1InfQogICAgfSkKICAgIGlmICghJFN0YXQgLWFuZCAkT25GYWlsKSB7JiAkT25GYWlsfQogICAgaWYgKCRQYXNzVGhydSAtb3IgISRPbkZhaWwpIHtyZXR1cm4gJFN0YXR9Cn0KCmZ1bmN0aW9uIFdyaXRlLUFQIHsKICAgIFtDbWRsZXRCaW5kaW5nKCldCiAgICBwYXJhbShbUGFyYW1ldGVyKFZhbHVlRnJvbVBpcGVsaW5lPTEsIE1hbmRhdG9yeT0xKV0kVGV4dCxbU3dpdGNoXSROb1NpZ24sW1N3aXRjaF0kUGxhaW5UZXh0LFtWYWxpZGF0ZVNldCgiQ2VudGVyIiwiUmlnaHQiLCJMZWZ0IildW1N0cmluZ10kQWxpZ249J0xlZnQnLFtTd2l0Y2hdJFBhc3NUaHJ1KQogICAgYmVnaW4geyRUVCA9IEAoKX0KICAgIFByb2Nlc3MgeyRUVCArPSAsJFRleHR9CiAgICBFTkQgewogICAgICAgICRCbHVlID0gJChpZiAoJEFQX0NPTlNPTEUuY3VzdG9tRmxhZ3MubGVnYWN5Q29sb3JzKXszfWVsc2UgeydCbHVlJ30pCiAgICAgICAgaWYgKCRUVC5jb3VudCAtZXEgMSkgeyRUVCA9ICRUVFswXX07JFRleHQgPSAkVFQKICAgICAgICBpZiAoJHRleHQuY291bnQgLWd0IDEgLW9yICR0ZXh0LkdldFR5cGUoKS5OYW1lIC1tYXRjaCAiXFtcXSQiKSB7CiAgICAgICAgICAgIHJldHVybiAkVGV4dCB8ICUgewogICAgICAgICAgICAgICAgV3JpdGUtQVAgJF8gLU5vU2lnbjokTm9TaWduIC1QbGFpblRleHQ6JFBsYWluVGV4dCAtQWxpZ24gJEFsaWduIC1QYXNzVGhydTokUGFzc1RocnUKICAgICAgICAgICAgfQogICAgICAgIH0KICAgICAgICBpZiAoISR0ZXh0IC1vciAkdGV4dCAtbm90bWF0Y2ggIig/c21pKV4oKD88Tk5MPngpfCg/PE5TPm5zPykpezAsMn0oPzx0Plw+KikoPzxzPltcK1wtXCFcKlwjXEBfXSkoPzx3Pi4qKSIpIHtyZXR1cm4gQWxpZ24tVGV4dCAkVGV4dCAtQWxpZ24gJEFsaWduIHwgV3JpdGUtSG9zdH0KICAgICAgICAkdGIgID0gIiAgICAiKiRNYXRjaGVzLnQubGVuZ3RoCiAgICAgICAgJENvbCA9IEB7JysnPScyJzsnLSc9JzEyJzsnISc9JzE0JzsnKic9JEJsdWU7JyMnPSdEYXJrR3JheSc7J0AnPSdHcmF5JzsnXyc9J3doaXRlJ31bKCRTaWduID0gJE1hdGNoZXMuUyldCiAgICAgICAgaWYgKCEkQ29sKSB7VGhyb3cgIkluY29ycmVjdCBTaWduIFskU2lnbl0gUGFzc2VkISJ9CiAgICAgICAgJFNpZ24gPSAkKGlmICgkTm9TaWduIC1vciAkTWF0Y2hlcy5OUykgeyIifSBlbHNlIHsiWyRTaWduXSAifSkKICAgICAgICAkRGF0YSA9ICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiO2lmICghJERhdGEpIHtyZXR1cm4gV3JpdGUtSG9zdCAiIn0KICAgICAgICBpZiAoQVAtUmVxdWlyZSAiZnVuY3Rpb246QWxpZ24tVGV4dCIgLXBhKSB7CiAgICAgICAgICAgICREYXRhID0gQWxpZ24tVGV4dCAtQWxpZ24gJEFsaWduICIkdGIkU2lnbiQoJE1hdGNoZXMuVykiCiAgICAgICAgfQogICAgICAgIGlmICgkUGxhaW5UZXh0KSB7cmV0dXJuICREYXRhfQogICAgICAgICREYXRhTGluZXMgPSAkRGF0YSAtc3BsaXQgImBuIgogICAgICAgIDEuLiREYXRhTGluZXMuQ291bnQgfCAlIHsKICAgICAgICAgICAgJElkeCA9ICRfIC0gMQogICAgICAgICAgICAkTk5MID0gISRpZHggLWFuZCAkTWF0Y2hlcy5OTkwKICAgICAgICAgICAgV3JpdGUtSG9zdCAtTm9OZXdMaW5lOiROTkwgLWYgJENvbCAkRGF0YUxpbmVzWyRJZHhdCiAgICAgICAgICAgIGlmICgkUGFzc1RocnUpIHtyZXR1cm4gJERhdGF9CiAgICAgICAgfQogICAgfQp9CgpmdW5jdGlvbiBGbGF0dGVuIHtwYXJhbShbb2JqZWN0W11dJHgpDQoKICAgIGlmICghKCRYIC1pcyBbYXJyYXldKSkge3JldHVybiAkeH0KICAgIGlmICgkWC5jb3VudCAtZXEgMSkgewogICAgICAgIHJldHVybiAkeCB8ICUgeyRffQogICAgfQogICAgJHggfCAlIHtGbGF0dGVuICRffQp9CgpmdW5jdGlvbiBHZXQtV2hlcmUgewogICAgW0NtZGxldEJpbmRpbmcoRGVmYXVsdFBhcmFtZXRlclNldE5hbWU9Ik5vcm1hbCIpXQogICAgcGFyYW0oCiAgICAgICAgW1BhcmFtZXRlcihNYW5kYXRvcnk9JHRydWUsIFBvc2l0aW9uPTApXVtzdHJpbmddJEZpbGUsCiAgICAgICAgW1N3aXRjaF0kQWxsLAogICAgICAgIFtQYXJhbWV0ZXIoUGFyYW1ldGVyU2V0TmFtZT0nTm9ybWFsJyldW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW1N3aXRjaF0kTWFudWFsU2NhbiwKICAgICAgICBbUGFyYW1ldGVyKFBhcmFtZXRlclNldE5hbWU9J1NjYW4nKV1bU3dpdGNoXSREYmcsCiAgICAgICAgW1BhcmFtZXRlcihQYXJhbWV0ZXJTZXROYW1lPSdTY2FuJyldW3N0cmluZ10kUGF0aFZhciA9ICJQQVRIIgogICAgKQogICAgJElzVmVyYm9zZSA9ICREYmcgLW9yICRQU0NtZGxldC5NeUludm9jYXRpb24uQm91bmRQYXJhbWV0ZXJzLlZlcmJvc2UgLW9yICRQU0NtZGxldC5NeUludm9jYXRpb24uQm91bmRQYXJhbWV0ZXJzLkRlYnVnCiAgICAkV2hlcmVCaW5FeGlzdHMgPSBHZXQtQ29tbWFuZCAid2hlcmUiIC1lYSBTaWxlbnRseUNvbnRpbnVlCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCIKICAgIGlmICgkRmlsZSAtZXEgIndoZXJlIiAtb3IgJEZpbGUgLWVxICJ3aGVyZS5leGUiKSB7cmV0dXJuICRXaGVyZUJpbkV4aXN0c30KICAgIGlmICgkV2hlcmVCaW5FeGlzdHMgLWFuZCAhJE1hbnVhbFNjYW4pIHsKICAgICAgICAkT3V0PSRudWxsCiAgICAgICAgaWYgKCRJc1VuaXgpIHskT3V0ID0gd2hpY2ggJGZpbGUgMj4kbnVsbH0gZWxzZSB7JE91dCA9IHdoZXJlLmV4ZSAkZmlsZSAyPiRudWxsfQoKICAgICAgICBpZiAoISRPdXQpIHtyZXR1cm59CiAgICAgICAgaWYgKCRBbGwpIHtyZXR1cm4gJE91dH0KICAgICAgICByZXR1cm4gQCgkT3V0KVswXQogICAgfQogICAgZm9yZWFjaCAoJEZvbGRlciBpbiAoR2V0LVBhdGggLVBhdGhWYXIgJFBhdGhWYXIpKSB7CiAgICAgICAgaWYgKCRJc1VuaXgpIHsKICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlIgogICAgICAgICAgICBpZiAoJElzVmVyYm9zZSkge1dyaXRlLUFQICIqQ2hlY2tpbmcgWyRMb29rdXBdIn0KICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9CiAgICAgICAgICAgIFJlc29sdmUtUGF0aCAkTG9va3VwIHwgJSBQYXRoCiAgICAgICAgICAgIGlmICghJEFsbCkge3JldHVybn0KICAgICAgICB9IGVsc2UgewogICAgICAgICAgICBmb3JlYWNoICgkRXh0ZW5zaW9uIGluIChHZXQtUGF0aCAtUGF0aFZhciBQQVRIRVhUKSkgewogICAgICAgICAgICAgICAgJExvb2t1cCA9ICIkRm9sZGVyLyRGaWxlJEV4dGVuc2lvbiIKICAgICAgICAgICAgICAgIGlmICgkSXNWZXJib3NlKSB7V3JpdGUtQVAgIipDaGVja2luZyBbJExvb2t1cF0ifQogICAgICAgICAgICAgICAgaWYgKCEoVGVzdC1QYXRoIC1QYXRoVHlwZSBMZWFmICRMb29rdXApKSB7Y29udGludWV9CiAgICAgICAgICAgICAgICBSZXNvbHZlLVBhdGggJExvb2t1cCB8ICUgUGF0aAogICAgICAgICAgICAgICAgaWYgKCEkQWxsKSB7cmV0dXJufQogICAgICAgICAgICB9CiAgICAgICAgfQogICAgfQp9CgpmdW5jdGlvbiBHZXQtT1MgewogICAgaWYgKCRQU1ZlcnNpb25UYWJsZS5QU0VkaXRpb24gLWVxICdDb3JlJykgewogICAgICAgIGlmICgkSXNXaW5kb3dzKSB7cmV0dXJuICdXaW5kb3dzJ30KICAgICAgICBlbHNlaWYgKCRJc0xpbnV4KSB7cmV0dXJuICdMaW51eCd9CiAgICAgICAgZWxzZWlmICgkSXNNYWNPUykge3JldHVybiAnTWFjT1MnfQogICAgfSBlbHNlIHtyZXR1cm4gJ1dpbmRvd3MnfQp9CgpmdW5jdGlvbiBKUy1PUiB7Zm9yZWFjaCAoJGEgaW4gJGFyZ3MpIHskciA9IEludm9rZS1PclJldHVybiAkYTtpZiAoISRyKXtjb250aW51ZX07cmV0dXJuICRyfTtyZXR1cm4gJHJ9CgpmdW5jdGlvbiBQbGFjZS1CdWZmZXJlZENvbnRlbnQge3BhcmFtKCRUZXh0LCAkeCwgJHksIFtDb25zb2xlQ29sb3JdJEZvcmVncm91bmRDb2xvcj1bQ29uc29sZV06OkZvcmVncm91bmRDb2xvciwgW0NvbnNvbGVDb2xvcl0kQmFja2dyb3VuZENvbG9yPVtDb25zb2xlXTo6QmFja2dyb3VuZENvbG9yKQ0KCiAgICBpZiAoISRUZXh0KSB7cmV0dXJufQogICAgJGNyZCA9IFtNYW5hZ2VtZW50LkF1dG9tYXRpb24uSG9zdC5Db29yZGluYXRlc106Om5ldygkeCwkeSkKICAgICRiID0gJEhvc3QuVUkuUmF3VUkKICAgICRhcnIgPSAkYi5OZXdCdWZmZXJDZWxsQXJyYXkoQCgkVGV4dCksICRGb3JlZ3JvdW5kQ29sb3IsICRCYWNrZ3JvdW5kQ29sb3IpCiAgICAkeCA9IFtDb25zb2xlXTo6QnVmZmVyV2lkdGgtMS0kVGV4dC5sZW5ndGgKICAgICRiLlNldEJ1ZmZlckNvbnRlbnRzKCRjcmQsICRhcnIpCn0KCmZ1bmN0aW9uIEdldC1QYXRoVmFyU2VwIHtwYXJhbShbc3RyaW5nXSRPdmVycmlkZSA9ICIiKQ0KCiAgICAkSXNVbml4ID0gJFBTVmVyc2lvblRhYmxlLlBsYXRmb3JtIC1lcSAiVW5peCIKICAgIHJldHVybiBKUy1PUiAkT3ZlcnJpZGUgKD86ICRJc1VuaXggIjoiICI7IikKfQoKZnVuY3Rpb24gVGVzdC1BZG1pbmlzdHJhdG9yIHsKICAgIGlmICgkUFNWZXJzaW9uVGFibGUuUGxhdGZvcm0gLWVxICJVbml4IikgewogICAgICAgIGlmICgkKHdob2FtaSkgLWVxICJyb290Iikge3JldHVybiAkdHJ1ZX0KICAgICAgICBlbHNlIHtyZXR1cm4gJGZhbHNlfQogICAgfQogICAgIyBXaW5kb3dzCiAgICAoTmV3LU9iamVjdCBTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c1ByaW5jaXBhbCAoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzSWRlbnRpdHldOjpHZXRDdXJyZW50KCkpKS5Jc0luUm9sZShbU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NCdWlsdGluUm9sZV06OkFkbWluaXN0cmF0b3IpCn0KCmZ1bmN0aW9uIEFsaWduLVRleHQgewogICAgW0NtZGxldEJpbmRpbmcoKV0KICAgIFtPdXRwdXRUeXBlKFtTdHJpbmddLCBbSGFzaHRhYmxlXSldCiAgICBwYXJhbSgKICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0xLCBWYWx1ZUZyb21QaXBlbGluZT0xKV1bQWxsb3dFbXB0eVN0cmluZygpXVtTdHJpbmdbXV0kVGV4dCwKICAgICAgICBbc3dpdGNoXSRDb2xvckNvZGVzRGlzY3JldGVQZXJMaW5lLAogICAgICAgIFtzd2l0Y2hdJFBvcmNlbGFpbiwKICAgICAgICAjIFRoaXMgY2FuIGJlIFtpbnRdIG9yIFtzY3JpcHRibG9ja10KICAgICAgICAkQ29uc3RyYWluVG9XaWR0aCwKICAgICAgICBbVmFsaWRhdGVTZXQoIkNlbnRlciIsIlJpZ2h0IiwiTGVmdCIpXVtTdHJpbmddJEFsaWduPSdDZW50ZXInCiAgICApCiAgICBiZWdpbiB7CiAgICAgICAgJGlzVmVyYm9zZSA9ICRQU0NtZGxldC5NeUludm9jYXRpb24uQm91bmRQYXJhbWV0ZXJzLlZlcmJvc2UKICAgICAgICAkRXNjYXBlQ29kZVNwbGl0dGVyID0gIiQoW3JlZ2V4XTo6ZXNjYXBlKCIkKEdldC1Fc2NhcGUpWyIpKVxkKyg/Olw7XGQrKSptIgogICAgICAgICREaXZpZGVycyA9IEB7Y2h1bmsgPSBQcm9jZXNzLVVuaWNvZGUgImB1ezExMjg4fSI7IHN0eWxlID0gUHJvY2Vzcy1Vbmljb2RlICJgdXsxMjI4OH0ifQogICAgICAgICRGaW5hbEZvcm1hdHRlciA9IHsKICAgICAgICAgICAgcGFyYW0oJExpbmVzLCAkU3R5bGVzKQogICAgICAgICAgICBpZiAoISRQb3JjZWxhaW4pIHtyZXR1cm4gJExpbmVzfQogICAgICAgICAgICBpZiAoJG51bGwgLWVxICRTdHlsZXMpIHskU3R5bGVzID0gW1JlZ2V4XTo6TWF0Y2hlcygoJExpbmVzIC1qb2luICIiKSwgJEVzY2FwZUNvZGVTcGxpdHRlcikudmFsdWV9CiAgICAgICAgICAgIHJldHVybiBAe0xpbmVzID0gJExpbmVzOyBSdW5uaW5nU3R5bGVzID0gJFN0eWxlc30KICAgICAgICB9CiAgICB9CiAgICBwcm9jZXNzIHsKICAgICAgICBpZiAoJEFsaWduIC1lcSAiTGVmdCIpIHtyZXR1cm4gJiAkRmluYWxGb3JtYXR0ZXIgJFRleHR9CiAgICAgICAgaWYgKCEiJFRleHQiLnRyaW0oKSkge3JldHVybiAkVGV4dH0KICAgICAgICAkV2luU2l6ZSA9ID86ICRDb25zdHJhaW5Ub1dpZHRoIHtJbnZva2UtT3JSZXR1cm4gJENvbnN0cmFpblRvV2lkdGh9IChbY29uc29sZV06OkJ1ZmZlcldpZHRoKQogICAgICAgIAogICAgICAgICRUZXh0ID0gJFRleHQgLXNwbGl0ICJgcj9gbiIKICAgICAgICBpZiAoJFRleHQuY291bnQgLWd0IDEpIHsKICAgICAgICAgICAgJExpbmVzID0gJFRleHQgfCBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gLUNvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmU6JENvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmUgLVBvcmNlbGFpbgogICAgICAgICAgICBpZiAoJENvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmUpIHsKICAgICAgICAgICAgICAgIGZvciAoJGkgPSAxOyAkaSAtbHQgJExpbmVzLkNvdW50OyAkaSsrKSB7CiAgICAgICAgICAgICAgICAgICAgJExpbmUgPSAkTGluZXNbJGldCiAgICAgICAgICAgICAgICAgICAgJFByZXZTdHlsZXMgKz0gJExpbmVzWyRpIC0gMV0uUnVubmluZ1N0eWxlcwogICAgICAgICAgICAgICAgICAgICRMaW5lLkxpbmVzID0gJExpbmUuTGluZXMgfCAlIHsiJFByZXZTdHlsZXMkXyJ9CiAgICAgICAgICAgICAgICAgICAgJExpbmUuUnVubmluZ1N0eWxlcyA9ICIkUHJldlN0eWxlcyQoJExpbmUuUnVubmluZ1N0eWxlcykiCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0KICAgICAgICAgICAgcmV0dXJuICYgJEZpbmFsRm9ybWF0dGVyIChGbGF0dGVuICRMaW5lcy5MaW5lcykgKCRMaW5lcy5SdW5uaW5nU3R5bGVzIC1qb2luICIiKQogICAgICAgIH0KICAgICAgICAjIFNpbmdsZSBub24gYG4gbGluZSBwcm9jZXNzCiAgICAgICAgJENsZWFuVGV4dFNpemUgPSAoU3RyaXAtQ29sb3JDb2RlcyAoIiIrJFRleHQpKS5MZW5ndGgKCiAgICAgICAgIyA9PT09PT09PSBMaW5lIGlzIDwgJFdpblNpemUgPT09PT09PT09PT09PT18CiAgICAgICAgaWYgKCRDbGVhblRleHRTaXplIC1sZSAkV2luU2l6ZSkgewogICAgICAgICAgICBpZiAoJEFsaWduIC1lcSAiQ2VudGVyIikgewogICAgICAgICAgICAgICAgcmV0dXJuICYgJEZpbmFsRm9ybWF0dGVyICgiICIqW21hdGhdOjp0cnVuY2F0ZSgoJFdpblNpemUtJENsZWFuVGV4dFNpemUpLzIpKyRUZXh0KQogICAgICAgICAgICB9CiAgICAgICAgICAgICMgUmlnaHQKICAgICAgICAgICAgcmV0dXJuICYgJEZpbmFsRm9ybWF0dGVyICgiICIqKCRXaW5TaXplLSRDbGVhblRleHRTaXplKSskVGV4dCkKICAgICAgICB9CgogICAgICAgICMgPT09PT09PT0gTGluZSBpcyA+PSAkV2luU2l6ZSA9PT09PT09PT09PT09PXwKICAgICAgICAjIFRyYWNraW5nIFN0eWxlcwogICAgICAgICRSdW5uaW5nU3R5bGVzID0gIiIKICAgICAgICAkQ3VycmxpbmUgPSBAewogICAgICAgICAgICBzdHlsZWREYXRhID0gIiIKICAgICAgICAgICAgY29udGVudFNpemUgPSAwCiAgICAgICAgICAgIGZpbmFsTGluZXMgPSBAKCkKICAgICAgICAgICAgbmV4dCA9IHsKICAgICAgICAgICAgICAgICMgV3JpdGUtVmVyYm9zZSAiKiRJbnZvayB8IE5ldyBMaW5lIHwgTGluZURhdGE6ICQoKCcnKyRDdXJybGluZS5zdHlsZWREYXRhLkxlbmd0aCkuUGFkTGVmdCgzKSkiCiAgICAgICAgICAgICAgICAkQ3VycmxpbmUuZmluYWxMaW5lcyArPSAsJEN1cnJsaW5lLnN0eWxlZERhdGEKICAgICAgICAgICAgICAgICRDdXJybGluZS5zdHlsZWREYXRhID0gJFJ1bm5pbmdTdHlsZXMKICAgICAgICAgICAgICAgICRDdXJybGluZS5jb250ZW50U2l6ZSA9IDAKICAgICAgICAgICAgICAgICMgV3JpdGUtVmVyYm9zZSAiKiRJbnZvayB8IEN1cnIgVG90YWwgTGluZXM6ICQoJGN1cnJsaW5lLmZpbmFsTGluZXMuQ291bnQpIgogICAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgICRBbGxDaHVua3MgPSAkVGV4dCAtcmVwbGFjZSAiKCR7RXNjYXBlQ29kZVNwbGl0dGVyfSkrKC4qPykoPz0ke0VzY2FwZUNvZGVTcGxpdHRlcn18JCkiLCIkKCREaXZpZGVycy5jaHVuaylgJDEkKCREaXZpZGVycy5zdHlsZSlgJDIiIC1zcGxpdCAkRGl2aWRlcnMuY2h1bmsKICAgICAgICBpZiAoJEFsbENodW5rc1swXSAtbm90Y29udGFpbnMgJERpdmlkZXJzLnN0eWxlKSB7JEFsbENodW5rc1swXSA9ICIkKCREaXZpZGVycy5zdHlsZSkkKCRBbGxDaHVua3NbMF0pIn0gIyBUaGUgZmlyc3QgY2h1bmsgY291bGQgaGF2ZSBubyBzdHlsZXMKICAgICAgICBmb3JlYWNoICgkQ3VyckNodW5rIGluICRBbGxDaHVua3MpIHsKICAgICAgICAgICAgJFN0eWxlLCRUZXh0Q2h1bmsgPSAkQ3VyckNodW5rIC1zcGxpdCAkRGl2aWRlcnMuc3R5bGUKICAgICAgICAgICAgJFJ1bm5pbmdTdHlsZXMgPSA/OiAkQ29sb3JDb2Rlc0Rpc2NyZXRlUGVyTGluZSAiJFJ1bm5pbmdTdHlsZXMkU3R5bGUiICRTdHlsZQogICAgICAgICAgICAjIFdyaXRlLUhvc3QgLWYgMiAoIkluY29taW5nU3R5bGU6ICRTdHlsZSB8IFJ1bm5pbmdTdHlsZXM6ICRSdW5uaW5nU3R5bGVzIiAtcmVwbGFjZSAoW3JlZ2V4XTo6RXNjYXBlKCQoR2V0LUVzY2FwZSkpKSwnXGUnKQogICAgICAgICAgICAjIFdyaXRlLUhvc3QgLWYgWWVsbG93ICJUZXh0Q2h1bms6ICRUZXh0Q2h1bmsiCiAgICAgICAgICAgICRDdXJybGluZS5zdHlsZWREYXRhICs9ICRSdW5uaW5nU3R5bGVzCiAgICAgICAgICAgICRUZXh0Q2h1bmtTdHJJbmRleCA9IDAKICAgICAgICAgICAgIyBXcml0ZS1WZXJib3NlICIqJEludm9rIHwgVGV4dENodW5rOiAkVGV4dENodW5rIHwgQWxsQ2h1bmtzU2l6ZTogJCgoJycrJEFsbENodW5rcy5MZW5ndGgpLlBhZExlZnQoMykpIgogICAgICAgICAgICB3aGlsZSAoJFRleHRDaHVua1N0ckluZGV4IC1sdCAkVGV4dENodW5rLkxlbmd0aCkgewogICAgICAgICAgICAgICAgaWYgKCRpc1ZlcmJvc2UpIHtQbGFjZS1CdWZmZXJlZENvbnRlbnQgKCIkSW52b2sgfCBMaW5lRGF0YTogJCgoJycrJEN1cnJsaW5lLnN0eWxlZERhdGEuTGVuZ3RoKS5QYWRMZWZ0KDMpKSB8IENodW5rSWR4OiAkKCgnJyskVGV4dENodW5rU3RySW5kZXgpLlBhZExlZnQoMykpIHwgQ2h1bmtMZW46ICQoJFRleHRDaHVuay5MZW5ndGgpIHwgRmluYWxMaW5lczogJCgkQ3VycmxpbmUuZmluYWxMaW5lcy5Db3VudCkiKSAteCAwIC15IChbQ29uc29sZV06OkJ1ZmZlckhlaWdodCAtIDEpIFllbGxvdyBEYXJrR3JheX0KICAgICAgICAgICAgICAgICRDaHVua1NpemUgPSAkVGV4dENodW5rLkxlbmd0aCAtICRUZXh0Q2h1bmtTdHJJbmRleAogICAgICAgICAgICAgICAgV3JpdGUtVmVyYm9zZSAiKkNodW5rU2l6ZTogJENodW5rU2l6ZSB8ICQoJEN1cnJsaW5lLmNvbnRlbnRTaXplKSB8ICRXaW5TaXplIgogICAgICAgICAgICAgICAgaWYgKCgkQ3VycmxpbmUuY29udGVudFNpemUrJENodW5rU2l6ZSkgLWx0ICRXaW5TaXplKSB7CiAgICAgICAgICAgICAgICAgICAgIyBJZiB0aGUgY3VycmVudCBjaHVuayBmaXRzIGluIHRoZSBjdXJyZW50IGxpbmUKICAgICAgICAgICAgICAgICAgICAkQ3VycmxpbmUuc3R5bGVkRGF0YSArPSAkVGV4dENodW5rLlN1YnN0cmluZygkVGV4dENodW5rU3RySW5kZXgpCiAgICAgICAgICAgICAgICAgICAgJEN1cnJsaW5lLmNvbnRlbnRTaXplICs9ICRDaHVua1NpemUKICAgICAgICAgICAgICAgICAgICAkVGV4dENodW5rU3RySW5kZXggKz0gJENodW5rU2l6ZQogICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlCiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICAjIElmIHRoZSBjdXJyZW50IGNodW5rIGRvZXNuJ3QgZml0IGluIHRoZSBjdXJyZW50IGxpbmUKICAgICAgICAgICAgICAgICRuZXdDb250ZW50ID0gJFRleHRDaHVuay5TdWJzdHJpbmcoJFRleHRDaHVua1N0ckluZGV4LCAkV2luU2l6ZS0kQ3VycmxpbmUuY29udGVudFNpemUpCiAgICAgICAgICAgICAgICAkQ3VycmxpbmUuc3R5bGVkRGF0YSArPSAkbmV3Q29udGVudAogICAgICAgICAgICAgICAgJEN1cnJsaW5lLmNvbnRlbnRTaXplICs9ICRuZXdDb250ZW50Lmxlbmd0aAogICAgICAgICAgICAgICAgJFRleHRDaHVua1N0ckluZGV4ICs9ICRuZXdDb250ZW50Lmxlbmd0aAogICAgICAgICAgICAgICAgJiAkQ3VycmxpbmUubmV4dAogICAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgIGlmICgkQ3VycmxpbmUuY29udGVudFNpemUgLWd0IDApIHsKICAgICAgICAgICAgaWYgKCRDdXJybGluZS5jb250ZW50U2l6ZSl7CiAgICAgICAgICAgICAgICBBbGlnbi1UZXh0IC1BbGlnbiAkQWxpZ24gLVRleHQgJEN1cnJsaW5lLnN0eWxlZERhdGEgLUNvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmU6JENvbG9yQ29kZXNEaXNjcmV0ZVBlckxpbmUgfCA/IHskX30gfCAlIHsKICAgICAgICAgICAgICAgICAgICAkQ3VycmxpbmUuZmluYWxMaW5lcyArPSAsJF8KICAgICAgICAgICAgICAgIH0KICAgICAgICAgICAgfSBlbHNlIHskQ3VycmxpbmUuZmluYWxMaW5lc1stMV0gKz0gJEN1cnJsaW5lLnN0eWxlZERhdGF9CiAgICAgICAgfQogICAgICAgIHJldHVybiAmICRGaW5hbEZvcm1hdHRlciAkQ3VycmxpbmUuZmluYWxMaW5lcyAkUnVubmluZ1N0eWxlcwogICAgICAgIHJldHVybiAkQ3VycmxpbmUuZmluYWxMaW5lcwogICAgfQp9CgpmdW5jdGlvbiBKUy1OQ1Ege2ZvcmVhY2ggKCRhIGluICRhcmdzKSB7JHIgPSBJbnZva2UtT3JSZXR1cm4gJGE7aWYgKCRudWxsIC1uZSAkcikge3JldHVybiAkcn19O3JldHVybiAkcn0KCmZ1bmN0aW9uIEdldC1Fc2NhcGUgewogICAgaWYgKCRudWxsIC1lcSAkQVBfQ09OU09MRS5jdXN0b21GbGFncy5fX2RldGVjdGVkX2VzY2FwZV9jb2RlcykgeyRBUF9DT05TT0xFLmN1c3RvbUZsYWdzLl9fZGV0ZWN0ZWRfZXNjYXBlX2NvZGVzID0gQVAtUmVxdWlyZSAiYWJpbGl0eTplc2NhcGVfY29kZXMifQogICAgaWYgKCEkQVBfQ09OU09MRS5jdXN0b21GbGFncy5fX2RldGVjdGVkX2VzY2FwZV9jb2RlcyAtYW5kICEkQVBfQ09OU09MRS5jdXN0b21GbGFncy5mb3JjZVVuaXhFc2NhcGVzKSB7dGhyb3cgIltBUENvbnNvbGU6OkdldC1Fc2NhcGVdIFlvdXIgY29uc29sZSBkb2VzIG5vdCBzdXBwb3J0IEFOU0kgZXNjYXBlIGNvZGVzLiBZb3UgY2FuIHNldCBgJEFQX0NPTlNPTEUuY3VzdG9tRmxhZ3Mubm9Vbml4RXNjYXBlcyA9IGAkdHJ1ZSB0byBkaXNhYmxlIHVuaXggZXNjYXBlIGNvZGVzLiBPciwgdXNlOiBgJEFQX0NPTlNPTEUuY3VzdG9tRmxhZ3MuZm9yY2VVbml4RXNjYXBlcyB0byBhdHRlbXB0IGl0IGFueXdheXMifQogICAgIyBXZSBkbyB0aGlzLCBiZWNhdXNlIFBvd2VyU2hlbGwgTmF0aXZlIGRvZXNuJ3Qga25vdyBgZQogICAgcmV0dXJuIFtDaGFyXTB4MWIgIyBgZQp9CgpmdW5jdGlvbiBJbnZva2UtVGVybmFyeSB7cGFyYW0oJGRlY2lkZXIsICRpZnRydWUsICRpZmZhbHNlID0ge30pDQoKICAgICRJbnZva2VPclJldHVybiA9IHsKICAgICAgICBwYXJhbSgkQ21kKQogICAgICAgIGlmICgkQ21kIC1pcyBbU2NyaXB0QmxvY2tdKSB7JiAkQ21kfSBlbHNlIHskQ21kfQogICAgfQogICAgaWYgKCRkZWNpZGVyKSB7JiAkSW52b2tlT3JSZXR1cm4gJGlmdHJ1ZX0gZWxzZSB7JiAkSW52b2tlT3JSZXR1cm4gJGlmZmFsc2V9Cn0KCmZ1bmN0aW9uIEdldC1QYXRoIHtwYXJhbSgkbWF0Y2gsIFtzdHJpbmddJFBhdGhWYXIgPSAiUEFUSCIsIFtzdHJpbmddJFBhdGhTZXAgPSAiIikNCgogICAgJFB0aCA9IFtFbnZpcm9ubWVudF06OkdldEVudmlyb25tZW50VmFyaWFibGUoJFBhdGhWYXIpCiAgICAkUGF0aFNlcCA9IEdldC1QYXRoVmFyU2VwICRQYXRoU2VwCiAgICBpZiAoISRQdGgpIHtyZXR1cm4gQCgpfQogICAgU2V0LVBhdGggJFB0aCAtUGF0aFZhciAkUGF0aFZhciAtUGF0aFNlcCAkUGF0aFNlcAogICAgJGQgPSAoJFB0aCkuc3BsaXQoJFBhdGhTZXApCiAgICBpZiAoJG1hdGNoKSB7JGQgLW1hdGNoICRtYXRjaH0gZWxzZSB7JGR9Cn0KClNldC1BbGlhcyB3aGljaCBHZXQtV2hlcmUKU2V0LUFsaWFzID86IEludm9rZS1UZXJuYXJ5")
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

