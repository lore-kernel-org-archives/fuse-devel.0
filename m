Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D023ADB9A
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 17:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607994; cv=none; b=gUi04PeOoK+TGPy/85yItOunDUs1NytmWFHWE5+lqdJLwz+U6AKM5r9ZfEi1c5NSXeG2mHH5fPHtbp0RrB3d137qBrA1hsJbx1c+/Z6PPo3TKG4Vx2ONyhutGlmZIwpULB0eVwHYr03S2Up0ttZMADpQfidd9CRkejFLJG6VI3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607994; c=relaxed/simple;
	bh=LE6ObWr360AzkYgTOoPbKJuFljf6cfmEBBORF0kbQpc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VhwspO+4z32Z7vwNUvbTUCvyjb287n2h4GoOurL+8ktYd6ME8KYtkMmYZMBLotk+GW50IpkVkLaecG3aXHE4BWy+mMlTiNHe+pNfZUq8FqTCa9LLTUDvaukqrfL3On7JQw7qyjGVyKTHq+nAZMtd3gCutDJISJ2NA8SSUbUaUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7qlh9wu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7qlh9wu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F16C2BCB0;
	Tue, 12 May 2026 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778607994;
	bh=LE6ObWr360AzkYgTOoPbKJuFljf6cfmEBBORF0kbQpc=;
	h=Date:From:To:Cc:Subject:From;
	b=p7qlh9wu0tXHUTV6qaiaq19xSIh9wvroBkU27eN3wNL4DK/Lu3/E7GG+9Mn9JI3Fq
	 NePAvKwGr7XbZuVdZ5h7YeHeDTDdQd7flwg664R6T0OyBts3XkDuJ5tt5QU4qa2/NS
	 A+h2Bh+WLT2f3R1BjSiA32p6zke4LisHVvZutFENpQ3do6nEY2tQRLZRHNX5o22div
	 vCdihkcrkXzVDu6woxLz8/bs2GaoTl/p6skOFZp0ghCZZH+TWuTSiF1aFxiqlgkNJm
	 IC9gO67/poaaM6NA8KDypgQ8vPU3QNhFmLzhouAmu+X5Yi9yPWL4oQ/SHjSOwd1emd
	 GJ4/8XdMgufLQ==
Date: Tue, 12 May 2026 10:46:33 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: [PATCH] checkpatch.pl: update to linux 7.0
Message-ID: <20260512174633.GA9544@frogsfrogsfrogs>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Darrick J. Wong <djwong@kernel.org>

Update this script to match the version from Linux 7.0, without
clobbering Bernd's _Atomic additions.  This fixes the complaints
about "overly long" Fixes: commit ids.

Signed-off-by: "Darrick J. Wong" <djwong@kernel.org>
---
 checkpatch.pl |  226 ++++++++++++++++++++++++++++++++++++++++++---------------
 1 file changed, 168 insertions(+), 58 deletions(-)

diff --git a/checkpatch.pl b/checkpatch.pl
index 2d44e0e6edac30..ae480dfd9c906c 100755
--- a/checkpatch.pl
+++ b/checkpatch.pl
@@ -113,7 +113,8 @@ Options:
   --max-line-length=n        set the maximum line length, (default $max_line_length)
                              if exceeded, warn on patches
                              requires --strict for use with --file
-  --min-conf-desc-length=n   set the min description length, if shorter, warn
+  --min-conf-desc-length=n   set the minimum description length for config symbols
+                             in lines, if shorter, warn (default $min_conf_desc_length)
   --tab-size=n               set the number of spaces for tab (default $tabsize)
   --root=PATH                PATH to the kernel tree root
   --no-summary               suppress the per-file summary
@@ -150,6 +151,24 @@ EOM
 	exit($exitcode);
 }
 
+my $DO_WHILE_0_ADVICE = q{
+   do {} while (0) advice is over-stated in a few situations:
+
+   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
+   file-scope, where C disallows code (it must be in functions).  See
+   $exceptions if you have one to add by name.
+
+   More troublesome is declarative macros used at top of new scope,
+   like DECLARE_PER_CPU.  These might just compile with a do-while-0
+   wrapper, but would be incorrect.  Most of these are handled by
+   detecting struct,union,etc declaration primitives in $exceptions.
+
+   Theres also macros called inside an if (block), which "return" an
+   expression.  These cannot do-while, and need a ({}) wrapper.
+
+   Enjoy this qualification while we work to improve our heuristics.
+};
+
 sub uniq {
 	my %seen;
 	return grep { !$seen{$_}++ } @_;
@@ -667,6 +686,9 @@ our $tracing_logging_tags = qr{(?xi:
 	[\.\!:\s]*
 )};
 
+# Device ID types like found in include/linux/mod_devicetable.h.
+our $dev_id_types = qr{\b[a-z]\w*_device_id\b};
+
 sub edit_distance_min {
 	my (@arr) = @_;
 	my $len = scalar @arr;
@@ -835,20 +857,16 @@ foreach my $entry (@mode_permission_funcs) {
 $mode_perms_search = "(?:${mode_perms_search})";
 
 our %deprecated_apis = (
-	"synchronize_rcu_bh"			=> "synchronize_rcu",
-	"synchronize_rcu_bh_expedited"		=> "synchronize_rcu_expedited",
-	"call_rcu_bh"				=> "call_rcu",
-	"rcu_barrier_bh"			=> "rcu_barrier",
-	"synchronize_sched"			=> "synchronize_rcu",
-	"synchronize_sched_expedited"		=> "synchronize_rcu_expedited",
-	"call_rcu_sched"			=> "call_rcu",
-	"rcu_barrier_sched"			=> "rcu_barrier",
-	"get_state_synchronize_sched"		=> "get_state_synchronize_rcu",
-	"cond_synchronize_sched"		=> "cond_synchronize_rcu",
 	"kmap"					=> "kmap_local_page",
 	"kunmap"				=> "kunmap_local",
 	"kmap_atomic"				=> "kmap_local_page",
 	"kunmap_atomic"				=> "kunmap_local",
+	#These should be enough to drive away new IDR users
+	"DEFINE_IDR"				=> "DEFINE_XARRAY",
+	"idr_init"				=> "xa_init",
+	"idr_init_base"				=> "xa_init_flags",
+	"rcu_read_lock_trace"			=> "rcu_read_lock_tasks_trace",
+	"rcu_read_unlock_trace"			=> "rcu_read_unlock_tasks_trace",
 );
 
 #Create a search pattern for all these strings to speed up a loop below
@@ -1085,7 +1103,9 @@ our $declaration_macros = qr{(?x:
 	(?:$Storage\s+)?(?:[A-Z_][A-Z0-9]*_){0,2}(?:DEFINE|DECLARE)(?:_[A-Z0-9]+){1,6}\s*\(|
 	(?:$Storage\s+)?[HLP]?LIST_HEAD\s*\(|
 	(?:SKCIPHER_REQUEST|SHASH_DESC|AHASH_REQUEST)_ON_STACK\s*\(|
-	(?:$Storage\s+)?(?:XA_STATE|XA_STATE_ORDER)\s*\(
+	(?:$Storage\s+)?(?:XA_STATE|XA_STATE_ORDER)\s*\(|
+	__cacheline_group_(?:begin|end)(?:_aligned)?\s*\(|
+	__dma_from_device_group_(?:begin|end)\s*\(
 )};
 
 our %allow_repeated_words = (
@@ -2625,6 +2645,11 @@ sub exclude_global_initialisers {
 		$realfile =~ m@/bpf/.*\.bpf\.c$@;
 }
 
+sub is_userspace {
+    my ($realfile) = @_;
+    return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
+}
+
 sub process {
 	my $filename = shift;
 
@@ -2876,7 +2901,7 @@ sub process {
 
 			if ($realfile =~ m@^include/asm/@) {
 				ERROR("MODIFIED_INCLUDE_ASM",
-				      "do not modify files in include/asm, change architecture specific files in include/asm-<architecture>\n" . "$here$rawline\n");
+				      "do not modify files in include/asm, change architecture specific files in arch/<architecture>/include/asm\n" . "$here$rawline\n");
 			}
 			$found_file = 1;
 		}
@@ -3011,6 +3036,16 @@ sub process {
 			}
 		}
 
+# Check for invalid patch separator
+		if ($in_commit_log &&
+		    $line =~ /^---.+/) {
+			if (ERROR("BAD_COMMIT_SEPARATOR",
+				  "Invalid commit separator - some tools may have problems applying this\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s/-/=/g;
+			}
+		}
+
 # Check for patch separator
 		if ($line =~ /^---$/) {
 			$has_patch_separator = 1;
@@ -3231,19 +3266,19 @@ sub process {
 			my $tag_case = not ($tag eq "Fixes:");
 			my $tag_space = not ($line =~ /^fixes:? [0-9a-f]{5,40} ($balanced_parens)/i);
 
-			my $id_length = not ($orig_commit =~ /^[0-9a-f]{12}$/i);
+			my $id_length = not ($orig_commit =~ /^[0-9a-f]{12,40}$/i);
 			my $id_case = not ($orig_commit !~ /[A-F]/);
 
 			my $id = "0123456789ab";
 			my ($cid, $ctitle) = git_commit_info($orig_commit, $id,
 							     $title);
 
-			if ($ctitle ne $title || $tag_case || $tag_space ||
-			    $id_length || $id_case || !$title_has_quotes) {
+			if (defined($cid) && ($ctitle ne $title || $tag_case || $tag_space || $id_length || $id_case || !$title_has_quotes)) {
+				my $fixed = "Fixes: $cid (\"$ctitle\")";
 				if (WARN("BAD_FIXES_TAG",
-				     "Please use correct Fixes: style 'Fixes: <12 chars of sha1> (\"<title line>\")' - ie: 'Fixes: $cid (\"$ctitle\")'\n" . $herecurr) &&
+				     "Please use correct Fixes: style 'Fixes: <12+ chars of sha1> (\"<title line>\")' - ie: '$fixed'\n" . $herecurr) &&
 				    $fix) {
-					$fixed[$fixlinenr] = "Fixes: $cid (\"$ctitle\")";
+					$fixed[$fixlinenr] = $fixed;
 				}
 			}
 		}
@@ -3283,7 +3318,7 @@ sub process {
 					# file delta changes
 		      $line =~ /^\s*(?:[\w\.\-\+]*\/)++[\w\.\-\+]+:/ ||
 					# filename then :
-		      $line =~ /^\s*(?:Fixes:|$link_tags_search|$signature_tags)/i ||
+		      $line =~ /^\s*(?:Fixes:|https?:|$link_tags_search|$signature_tags)/i ||
 					# A Fixes:, link or signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
@@ -3329,6 +3364,13 @@ sub process {
 			}
 		}
 
+# Check for auto-generated unhandled placeholder text (mostly for cover letters)
+		if (($in_commit_log || $in_header_lines) &&
+		    $rawline =~ /(?:SUBJECT|BLURB) HERE/) {
+			ERROR("PLACEHOLDER_USE",
+			      "Placeholder text detected\n" . $herecurr);
+		}
+
 # Check for git id commit length and improperly formed commit descriptions
 # A correctly formed commit description is:
 #    commit <SHA-1 hash length 12+ chars> ("Complete commit subject")
@@ -3492,9 +3534,10 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
+			my $rawline_utf8 = decode("utf8", $rawline);
+			while ($rawline_utf8 =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
 				my $typo = $1;
-				my $blank = copy_spacing($rawline);
+				my $blank = copy_spacing($rawline_utf8);
 				my $ptr = substr($blank, 0, $-[1]) . "^" x length($typo);
 				my $hereptr = "$hereline$ptr\n";
 				my $typo_fix = $spelling_fix{lc($typo)};
@@ -3656,7 +3699,7 @@ sub process {
 			    $help_length < $min_conf_desc_length) {
 				my $stat_real = get_stat_real($linenr, $ln - 1);
 				WARN("CONFIG_DESCRIPTION",
-				     "please write a help paragraph that fully describes the config symbol\n" . "$here\n$stat_real\n");
+				     "please write a help paragraph that fully describes the config symbol with at least $min_conf_desc_length lines\n" . "$here\n$stat_real\n");
 			}
 		}
 
@@ -3700,20 +3743,6 @@ sub process {
 			}
 		}
 
-		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
-		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
-			my $flag = $1;
-			my $replacement = {
-				'EXTRA_AFLAGS' =>   'asflags-y',
-				'EXTRA_CFLAGS' =>   'ccflags-y',
-				'EXTRA_CPPFLAGS' => 'cppflags-y',
-				'EXTRA_LDFLAGS' =>  'ldflags-y',
-			};
-
-			WARN("DEPRECATED_VARIABLE",
-			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
-		}
-
 # check for DT compatible documentation
 		if (defined $root &&
 			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
@@ -3745,6 +3774,18 @@ sub process {
 			}
 		}
 
+# Check for RGMII phy-mode with delay on PCB
+		if ($realfile =~ /\.(dts|dtsi|dtso)$/ &&
+		    $line =~ /^\+\s*(phy-mode|phy-connection-type)\s*=\s*"/ &&
+		    !ctx_has_comment($first_line, $linenr)) {
+			my $prop = $1;
+			my $mode = get_quoted_string($line, $rawline);
+			if ($mode =~ /^"rgmii(?:|-rxid|-txid)"$/) {
+				WARN("UNCOMMENTED_RGMII_MODE",
+				     "$prop $mode without comment -- delays on the PCB should be described, otherwise use \"rgmii-id\"\n" . $herecurr);
+			}
+		}
+
 # check for using SPDX license tag at beginning of files
 		if ($realline == $checklicenseline) {
 			if ($rawline =~ /^[ \+]\s*\#\!\s*\//) {
@@ -4828,7 +4869,7 @@ sub process {
 		}
 
 # do not use BUG() or variants
-		if ($line =~ /\b(?!AA_|BUILD_|DCCP_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
+		if ($line =~ /\b(?!AA_|BUILD_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
 			my $msg_level = \&WARN;
 			$msg_level = \&CHK if ($file);
 			&{$msg_level}("AVOID_BUG",
@@ -5514,9 +5555,9 @@ sub process {
 			}
 		}
 
-# check for unnecessary parentheses around comparisons in if uses
-# when !drivers/staging or command-line uses --strict
-		if (($realfile !~ m@^(?:drivers/staging/)@ || $check_orig) &&
+# check for unnecessary parentheses around comparisons
+# except in drivers/staging
+		if (($realfile !~ m@^(?:drivers/staging/)@) &&
 		    $perl_version_ok && defined($stat) &&
 		    $stat =~ /(^.\s*if\s*($balanced_parens))/) {
 			my $if_stat = $1;
@@ -5844,6 +5885,8 @@ sub process {
 #CamelCase
 			if ($var !~ /^$Constant$/ &&
 			    $var =~ /[A-Z][a-z]|[a-z][A-Z]/ &&
+#Ignore C keywords
+			    $var !~ /^_Generic$/ &&
 #Ignore some autogenerated defines and enum values
 			    $var !~ /^(?:[A-Z]+_){1,5}[A-Z]{1,3}[a-z]/ &&
 #Ignore Page<foo> variants
@@ -5905,9 +5948,9 @@ sub process {
 			}
 		}
 
-# multi-statement macros should be enclosed in a do while loop, grab the
-# first statement and ensure its the whole macro if its not enclosed
-# in a known good container
+# Usually multi-statement macros should be enclosed in a do {} while
+# (0) loop.  Grab the first statement and ensure its the whole macro
+# if its not enclosed in a known good container
 		if ($realfile !~ m@/vmlinux.lds.h$@ &&
 		    $line =~ /^.\s*\#\s*define\s*$Ident(\()?/) {
 			my $ln = $linenr;
@@ -5960,10 +6003,13 @@ sub process {
 
 			my $exceptions = qr{
 				$Declare|
+				# named exceptions
 				module_param_named|
 				MODULE_PARM_DESC|
 				DECLARE_PER_CPU|
 				DEFINE_PER_CPU|
+				static_assert|
+				# declaration primitives
 				__typeof__\(|
 				union|
 				struct|
@@ -5998,11 +6044,11 @@ sub process {
 					ERROR("MULTISTATEMENT_MACRO_USE_DO_WHILE",
 					      "Macros starting with if should be enclosed by a do - while loop to avoid possible if/else logic defects\n" . "$herectx");
 				} elsif ($dstat =~ /;/) {
-					ERROR("MULTISTATEMENT_MACRO_USE_DO_WHILE",
-					      "Macros with multiple statements should be enclosed in a do - while loop\n" . "$herectx");
+					WARN("MULTISTATEMENT_MACRO_USE_DO_WHILE",
+					      "Non-declarative macros with multiple statements should be enclosed in a do - while loop\n" . "$herectx\nBUT SEE:\n$DO_WHILE_0_ADVICE");
 				} else {
 					ERROR("COMPLEX_MACRO",
-					      "Macros with complex values should be enclosed in parentheses\n" . "$herectx");
+					      "Macros with complex values should be enclosed in parentheses\n" . "$herectx\nBUT SEE:\n$DO_WHILE_0_ADVICE");
 				}
 
 			}
@@ -6046,7 +6092,7 @@ sub process {
 				}
 
 # check if this is an unused argument
-				if ($define_stmt !~ /\b$arg\b/) {
+				if ($define_stmt !~ /\b$arg\b/ && $define_stmt) {
 					WARN("MACRO_ARG_UNUSED",
 					     "Argument '$arg' is not used in function-like macro\n" . "$herectx");
 				}
@@ -6702,6 +6748,13 @@ sub process {
 			}
 		}
 
+# check for context_unsafe without a comment.
+		if ($line =~ /\bcontext_unsafe\b/ &&
+		    !ctx_has_comment($first_line, $linenr)) {
+			WARN("CONTEXT_UNSAFE",
+			     "context_unsafe without comment\n" . $herecurr);
+		}
+
 # check of hardware specific defines
 		if ($line =~ m@^.\s*\#\s*if.*\b(__i386__|__powerpc64__|__sun__|__s390x__)\b@ && $realfile !~ m@include/asm-@) {
 			CHK("ARCH_DEFINES",
@@ -6913,7 +6966,7 @@ sub process {
 					    ($extension eq "f" &&
 					     defined $qualifier && $qualifier !~ /^w/) ||
 					    ($extension eq "4" &&
-					     defined $qualifier && $qualifier !~ /^cc/)) {
+					     defined $qualifier && $qualifier !~ /^c(?:[hlbc]|hR)$/)) {
 						$bad_specifier = $specifier;
 						last;
 					}
@@ -7003,21 +7056,20 @@ sub process {
 #				}
 #			}
 #		}
-
 # strcpy uses that should likely be strscpy
-		if ($line =~ /\bstrcpy\s*\(/) {
+		if ($line =~ /\bstrcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRCPY",
 			     "Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88\n" . $herecurr);
 		}
 
 # strlcpy uses that should likely be strscpy
-		if ($line =~ /\bstrlcpy\s*\(/) {
+		if ($line =~ /\bstrlcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRLCPY",
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
 # strncpy uses that should likely be strscpy or strscpy_pad
-		if ($line =~ /\bstrncpy\s*\(/) {
+		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
@@ -7228,17 +7280,42 @@ sub process {
 			    "Prefer $3(sizeof(*$1)...) over $3($4...)\n" . $herecurr);
 		}
 
-# check for (kv|k)[mz]alloc with multiplies that could be kmalloc_array/kvmalloc_array/kvcalloc/kcalloc
+# check for (kv|k)[mz]alloc that could be kmalloc_obj/kvmalloc_obj/kzalloc_obj/kvzalloc_obj
+		if ($perl_version_ok &&
+		    defined $stat &&
+		    $stat =~ /^\+\s*($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*,/) {
+			my $oldfunc = $3;
+			my $a1 = $4;
+			my $newfunc = "kmalloc_obj";
+			$newfunc = "kvmalloc_obj" if ($oldfunc eq "kvmalloc");
+			$newfunc = "kvzalloc_obj" if ($oldfunc eq "kvzalloc");
+			$newfunc = "kzalloc_obj" if ($oldfunc eq "kzalloc");
+
+			if ($a1 =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/) {
+				my $cnt = statement_rawlines($stat);
+				my $herectx = get_stat_here($linenr, $cnt, $here);
+
+				if (WARN("ALLOC_WITH_SIZEOF",
+					 "Prefer $newfunc over $oldfunc with sizeof\n" . $herectx) &&
+				    $cnt == 1 &&
+				    $fix) {
+					$fixed[$fixlinenr] =~ s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*,/$1 = $newfunc($a1,/;
+				}
+			}
+		}
+
+
+# check for (kv|k)[mz]alloc with multiplies that could be kmalloc_objs/kvmalloc_objs/kzalloc_objs/kvzalloc_objs
 		if ($perl_version_ok &&
 		    defined $stat &&
 		    $stat =~ /^\+\s*($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)\s*,/) {
 			my $oldfunc = $3;
 			my $a1 = $4;
 			my $a2 = $10;
-			my $newfunc = "kmalloc_array";
-			$newfunc = "kvmalloc_array" if ($oldfunc eq "kvmalloc");
-			$newfunc = "kvcalloc" if ($oldfunc eq "kvzalloc");
-			$newfunc = "kcalloc" if ($oldfunc eq "kzalloc");
+			my $newfunc = "kmalloc_objs";
+			$newfunc = "kvmalloc_objs" if ($oldfunc eq "kvmalloc");
+			$newfunc = "kvzalloc_objs" if ($oldfunc eq "kvzalloc");
+			$newfunc = "kzalloc_objs" if ($oldfunc eq "kzalloc");
 			my $r1 = $a1;
 			my $r2 = $a2;
 			if ($a1 =~ /^sizeof\s*\S/) {
@@ -7254,7 +7331,9 @@ sub process {
 					 "Prefer $newfunc over $oldfunc with multiply\n" . $herectx) &&
 				    $cnt == 1 &&
 				    $fix) {
-					$fixed[$fixlinenr] =~ s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1 . ' = ' . "$newfunc(" . trim($r1) . ', ' . trim($r2)/e;
+					my $sized = trim($r2);
+					$sized =~ s/^sizeof\s*\S\(?([^\)]*)\)?$/$1/;
+					$fixed[$fixlinenr] =~ s/\b($Lval)\s*\=\s*(?:$balanced_parens)?\s*((?:kv|k)[mz]alloc)\s*\(\s*($FuncArg)\s*\*\s*($FuncArg)/$1 . ' = ' . "$newfunc(" . $sized . ', ' . trim($r1)/e;
 				}
 			}
 		}
@@ -7677,6 +7756,37 @@ sub process {
 			WARN("DUPLICATED_SYSCTL_CONST",
 				"duplicated sysctl range checking value '$1', consider using the shared one in include/linux/sysctl.h\n" . $herecurr);
 		}
+
+# Check that *_device_id tables have sentinel entries.
+		if (defined $stat && $line =~ /struct\s+$dev_id_types\s+\w+\s*\[\s*\]\s*=\s*\{/) {
+			my $stripped = $stat;
+
+			# Strip diff line prefixes.
+			$stripped =~ s/(^|\n)./$1/g;
+			# Line continuations.
+			$stripped =~ s/\\\n/\n/g;
+			# Strip whitespace, empty strings, zeroes, and commas.
+			$stripped =~ s/""//g;
+			$stripped =~ s/0x0//g;
+			$stripped =~ s/[\s$;,0]//g;
+			# Strip field assignments.
+			$stripped =~ s/\.$Ident=//g;
+
+			if (!(substr($stripped, -4) eq "{}};" ||
+			      substr($stripped, -6) eq "{{}}};" ||
+			      $stripped =~ /ISAPNP_DEVICE_SINGLE_END}};$/ ||
+			      $stripped =~ /ISAPNP_CARD_END}};$/ ||
+			      $stripped =~ /NULL};$/ ||
+			      $stripped =~ /PCMCIA_DEVICE_NULL};$/)) {
+				ERROR("MISSING_SENTINEL", "missing sentinel in ID array\n" . "$here\n$stat\n");
+			}
+		}
+
+# check for uninitialized pointers with __free attribute
+		while ($line =~ /\*\s*($Ident)\s+__free\s*\(\s*$Ident\s*\)\s*[,;]/g) {
+			ERROR("UNINITIALIZED_PTR_WITH_FREE",
+			      "pointer '$1' with __free attribute should be initialized\n" . $herecurr);
+		}
 	}
 
 	# If we have no input at all, then there is nothing to report on
