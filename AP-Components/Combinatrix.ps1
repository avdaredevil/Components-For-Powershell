if (!$Global:_Fac_Table) {$Global:_Fac_Table = @{-1=0;0=1;1=1}}
function Global:f([int32]$x){$x=[Math]::Max($x,-1);if($Global:_Fac_Table[$x]){return $Global:_Fac_Table[$x]};$s = $x*(f ($x-1));return $Global:_Fac_Table[$x]=$s}
function Global:p($n,$r){$s=1;$n..($n-$r+1)|%{$s*=$_};$s}
function Global:c($n,$r){(p $n $r)/(f $r)}
function Global:pw($n,$p){[Math]::Pow($n,$p)}
Write-AP "x+Now Have: ["
"Factorial|f","Combination|c","Permutations|p","Power|pw" | % {Write-AP -noSign ("x!{0}({1})" -f $_.split("|"));if ($_[-1]-ne"w"){Write-AP -nosign "x*, "}else{Write-AP -nosign "*]"}}
