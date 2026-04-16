Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B9C38228C
	for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776324260; cv=pass; b=j2+h+N+NBH6VG2VhiHE1MoEkUr5YpwjmpTjGUSv+bh86rxz/E6w3G3dYejigPIhdmlLxz9Y7NYx2e9akl+ZWhmHWZvF20njdsvfY3xNm5qdnnaCwHTFYm+HqQL3zrthK6s/InDEGgzGiu98mmCXGBpCCmbOq3UL83Ps0GSM/4Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776324260; c=relaxed/simple;
	bh=ECUB8q0aCg4XGcpUy/SQPED5RClE4jObeguFxKxFQU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=co94X6IK+niEJc1RWatNmEFzwDcbih7BuGvG5K8fW+atZEaM+1KnFPE9opCKyK9L24ZUophlJ9T0PvNytb115DAVSU7/VV6dPPv3mM97ZqEISldGVg/BwRZ+XbaRL92faAS7GO5Ylfdbj12MYduOoWv0QytQxv0o0u7DUc65EIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4BHu14S; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4BHu14S"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ba23b5bcbd5so164539966b.2
        for <fuse-devel@lists.linux.dev>; Thu, 16 Apr 2026 00:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776324257; cv=none;
        d=google.com; s=arc-20240605;
        b=AZu6Uvi0+LKJCb4WXUvfC/ybQstdyaO60FsOH6Rf6V/v2fHhA9B83Msenx2Kja3EX4
         bW22erEfg1A44ujFueg685a+4D9r5VVE/Sk5RS0gGPEQKo44Emkk+UDCHVlmthlFZBfp
         8HaliXZbLUah9Aupx0R2GBaRPkSf+/SMqjgmvAOqi9uRvYjkJra6+sJYoVNa9GqJHGg1
         Kih4JAdQ43c3T4/3HOWTkqg38bCoC6KAZPSzhzhsYT0sIrOuxNm6Vi/7CIlik41GFQKy
         3k5dviNOHLRVuYbFO/Clq52Q9a2ohH+xgIeuXAYpiX8tVKrXP9ZycZIHoPHeGW7N3mgh
         k5WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u2C/qsShsmm3HWDhZkZLsQBlhGk6mz10/asru3tcxps=;
        fh=bq+CSi4GKuEAzEGno5D5FPhgMTPVBEJR8EQ0cbCKNuE=;
        b=JFUqnihP0GVJzUrRWVZHnAZ34lk48PqmrUHbwLmu7GTos3/ThUxHj61qwWX1n7sMCf
         WCV7q38aOP7CRlg+X9FmFxCfs6Pea93xKaZ3VBv2JkR2kugd6al1XDWgXVGl2xVDO/Kz
         ZvgGGUBEqM/4fjUyYMwieYzVnGvHznbZaV8oLTEF8cIMUIsm/DSiBkrrfXlkohSUeskC
         05e6fT8BN0KwKmBrnWO+XIokyZ/WUUyJXj9iMdTwf1fNQaeSArjtnMboFMsW11T3bXv5
         w1v5iv1If0a9gICmBBqtoOZpJnStDwwLGHxIZJiDojN8NGEPtQA9cCOuScJTJMrooLZK
         Umqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776324257; x=1776929057; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u2C/qsShsmm3HWDhZkZLsQBlhGk6mz10/asru3tcxps=;
        b=N4BHu14S6Iub7dWQlGWT+UfO2c0JiFjbmRm8ZsrvOER2jBdqO8j3IJ2IFh9N8NO8jd
         yKQumhIQGVLy68ImSF3Y+UQfe3VEs4Q64pjp6l60gTJaUjK+bac8cByCy3Bzsde/PBk/
         J2O6TpIcbijRc+/2DRBtZeU3WO3CSkcCZymrq7jaUBieCvE2AfEWduKfHok0aBDJIsNV
         5RKMgnxqdDSnHdVttwiK9B926cHWhc2RmPLxyIlfLyNdUJDLOYvpjKE74Gj63e371Sm/
         1BPf8DqlAW3I/DQFwLPqNoGgHua/OSKvEgQKSelRsm5eYnmo0oOsczsUbC5hQwhrZi8v
         F1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776324257; x=1776929057;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2C/qsShsmm3HWDhZkZLsQBlhGk6mz10/asru3tcxps=;
        b=jaDwijOuk71k4NfZMyL4ov5vu6HDZkgD2V2Fh6Or0/sFeaPCf8kTyIVOxNDkEae0Lb
         RycHUU8ZUWJrduHjKIHffVvSxBeXbgNetZZ/c3yQ9fcgYC4mqunm3MchqThKRIa4KXZQ
         ijXrBFGOArvD/sJJwwIRU8M7r3dgNadqF+fng1j6GGINuAiDR/UEDow6QozIAvn1+1br
         k76JlgRoZ5uiNoTGL4bM+yyXktijRRxx1InH45A7lU/5E3cBuaIsaixHQqakK/trF/Wm
         8M7zYs9UTRJVtSIogA7ZM0FN5tAP8hkVU5ILXPVGXDX7tES9puP/z2jAWgmfwxbz6bwh
         hxww==
X-Forwarded-Encrypted: i=1; AFNElJ+vjr/1ktb9srKFse6I0Nm8vpsU46+mYosHKhQ30y0qWr5/fcjJHUaMur0gFLLhvWtB5FiiHYT2ayN4@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2hAKMZ2N+gosRSs05KpGYu/6FgaCEWwsoX3ZsiU/tMTxDzD+6
	V2XFlMmFUsx/pVPz9Xh0byz+2Kq6Rh0O+71UjK5agO95vTKGhmiP9JvrUM/pq7QgrGPIYLOT0yd
	Bq5IPzEldqFlEdW8BtbR2+DRr9Dn2WVM=
X-Gm-Gg: AeBDievyOMT7B1XBvil7b3rnBbt6hzU0kHkkJ2Mlh0/5kI1p7YadY2hC1dF4oOJ03Q5
	BRjBa3EcLcMB8aF55ckUYJ6UJiD+ZgHJipZ8VNOr+OVu/q8Up8reBKqE3lJnXYQihxeXSR4Zesu
	wjBr9OgJtHDfxWekAbU2lfeup86sGBrj2jcBxW9obeMHUjQgRsHGe3+tUJGizPYJJ4iBHOZ9lYO
	UmLYLBQejkyEf0dLiPtnKiDunSPPGewduSjs80jG4FrGvNquZYoBqT/ufw5KzLVZzEvjA0t3lcd
	W7RoI1R4PU2t5+CzP3nfPnJskJfvUir08LbeYmfFU9m6UW39OcNC
X-Received: by 2002:a17:907:6ea7:b0:b9d:61c7:2343 with SMTP id
 a640c23a62f3a-b9d724ec21cmr1388021966b.10.1776324257065; Thu, 16 Apr 2026
 00:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <898a4e10-6193-4671-b3b1-7c7bc562a671@fmap.me>
In-Reply-To: <898a4e10-6193-4671-b3b1-7c7bc562a671@fmap.me>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 16 Apr 2026 09:24:04 +0200
X-Gm-Features: AQROBzDSrfDQcFz2WPHHHPGV1Lpy5R2aEp9xCRrhWW6cRqfeFGqFFuLTJbo-54U
Message-ID: <CAOQ4uxjoS-PvnZ2poh0bx0C6ocTYwuEpfV0q5md15SjS620OMg@mail.gmail.com>
Subject: Re: [fuse-devel] Debugging a stale kernel cache during file growth
To: Nikolay Amiantov <ab@fmap.me>
Cc: fuse-devel@lists.sourceforge.net, 
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, fuse-devel@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000059860a064f8eb8c7"

--00000000000059860a064f8eb8c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[CC new fuse-devel list and fsdevel]

On Wed, Apr 15, 2026 at 7:24=E2=80=AFPM Nikolay Amiantov via fuse-devel
<fuse-devel@lists.sourceforge.net> wrote:
>
> Hi everybody,
>
> I've recently encountered a weird issue with JuiceFS [1], a network FS
> which uses FUSE. tl;dr: when a file was being slowly appended, a reader
> of the same file on another host would periodically read a block of zero
> bytes instead of the actual data.
>
> While researching it I've built an MRE; turns out, this issue can be
> triggered on a fresh kernel and libfuse3 with:
> * A test FUSE FS which exposes a slowly growing file containing only
> 0xAA bytes, with disabled kernel stat cache and no handling of the read
> cache (so, with automatic cache handling by the kernel);
> * A script which reads the file sequentially checking for zeroes, while
> also hammering `os.stat` on the same file from separate threads.
>
> I couldn't find any prior discussion of this issue. I'm suspecting a
> kernel bug; sadly, I have no prior experience with the kernel-side FUSE
> subsystem, but with a lot of (disclosure) LLM help explaining the FUSE
> module and the kernel read cache architecture, I think I understand what
> happens and implemented a partial fix which, to me, makes sense.
>
> If I understand correctly, a full fix is impossible without VFS-level
> locking changes; I've actually managed to reproduce a similar issue in
> NFS [2]; this may be applicable to any network FS which may increase an
> inode size outside of `read`/`write`s.
>
> All my code, experiments and a kernel patch which makes the issue less
> frequent (but still existing) can be found at
> https://github.com/abbradar/fuse_growtest
>
> Any help checking my findings and pointing me in the right direction is
> appreciated!
>
> Thanks for your help,
> Nikolay.
>
> [1]: https://github.com/juicedata/juicefs/issues/5038
> [2]: https://github.com/abbradar/nfs_stale_cache_test
>
>

Hi Nikolay,

Your question is related to kernel filesystem and you also mention NFS,
so added fsdevel list for attention of relevant developers which are
not subscribed
to the fuse-devel list.

Also attaching your patch here for convenience.

Thanks,
Amir.

--00000000000059860a064f8eb8c7
Content-Type: text/x-patch; charset="UTF-8"; 
	name="0001-fuse-fix-stale-page-cache-data-race-on-file-growth.patch"
Content-Disposition: attachment; 
	filename="0001-fuse-fix-stale-page-cache-data-race-on-file-growth.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mo15gofr0>
X-Attachment-Id: f_mo15gofr0

RnJvbSAwMDdjODUzMWMwNjQ0ZTI1OTMyMWI4ZTFiMTUxMDAzNDM5Zjc1ZWJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBOaWtvbGF5IEFtaWFudG92IDxhYkBmbWFwLm1lPgpEYXRlOiBX
ZWQsIDE1IEFwciAyMDI2IDA3OjI4OjE5ICswMDAwClN1YmplY3Q6IFtQQVRDSF0gZnVzZTogZml4
IHN0YWxlIHBhZ2UgY2FjaGUgZGF0YSByYWNlIG9uIGZpbGUgZ3Jvd3RoCgpXaGVuIGEgRlVTRSBz
ZXJ2ZXIgcmVwb3J0cyBhIGxhcmdlciBmaWxlIHNpemUgdmlhIGxvb2t1cCBvciBnZXRhdHRyLApm
dXNlX2NoYW5nZV9hdHRyaWJ1dGVzKCkgdXBkYXRlcyBpX3NpemUgYmVmb3JlIGludmFsaWRhdGlu
ZyBzdGFsZSBwYWdlCmNhY2hlIGVudHJpZXMuIFRoZSBwYWdlIGJlZm9yZSB0aGUgRU9GIGNvbnRh
aW5zIGtlcm5lbC1nZW5lcmF0ZWQKemVyby1maWxsIGJleW9uZCB0aGUgb2xkIGlfc2l6ZS4gT25j
ZSBpX3NpemUgaXMgaW5jcmVhc2VkLCB0aGVzZSB6ZXJvZXMKYmVjb21lIHZpc2libGUgdG8gY29u
Y3VycmVudCByZWFkZXJzIGJlZm9yZSB3ZSBpbnZhbGlkYXRlIHRoZSBjYWNoZQpsYXRlciBvbi4K
CkZpeCB0aGlzIGJ5IGV2aWN0aW5nIHRoZSBhZmZlY3RlZCBwYWdlIGJlZm9yZSB1cGRhdGluZyBp
X3NpemUuIFRoZSBmaS0+bG9jawpzcGlubG9jayBpcyBkcm9wcGVkIGJlZm9yZSB0aGUgaW52YWxp
ZGF0aW9uICh3aGljaCBjYW4gc2xlZXApLCB0aGVuCnJlYWNxdWlyZWQgdG8gcmVjaGVjayBGVVNF
X0lfU0laRV9VTlNUQUJMRSBiZWZvcmUgdXBkYXRpbmcgaV9zaXplLgotLS0KIGZzL2Z1c2UvaW5v
ZGUuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9m
cy9mdXNlL2lub2RlLmMgYi9mcy9mdXNlL2lub2RlLmMKaW5kZXggNzM1YWJmNDI2YTA2Li42MWFl
MGY5NGU0ZGMgMTAwNjQ0Ci0tLSBhL2ZzL2Z1c2UvaW5vZGUuYworKysgYi9mcy9mdXNlL2lub2Rl
LmMKQEAgLTMzNCw4ICszMzQsNDIgQEAgdm9pZCBmdXNlX2NoYW5nZV9hdHRyaWJ1dGVzKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmdXNlX2F0dHIgKmF0dHIsCiAJICogZXh0ZW5kIGxvY2Fs
IGlfc2l6ZSB3aXRob3V0IGtlZXBpbmcgdXNlcnNwYWNlIHNlcnZlciBpbiBzeW5jLiBTbywKIAkg
KiBhdHRyLT5zaXplIGNvbWluZyBmcm9tIHNlcnZlciBjYW4gYmUgc3RhbGUuIFdlIGNhbm5vdCB0
cnVzdCBpdC4KIAkgKi8KLQlpZiAoIShjYWNoZV9tYXNrICYgU1RBVFhfU0laRSkpCi0JCWlfc2l6
ZV93cml0ZShpbm9kZSwgYXR0ci0+c2l6ZSk7CisJaWYgKCEoY2FjaGVfbWFzayAmIFNUQVRYX1NJ
WkUpKSB7CisJCS8qCisJCSAqIFdoZW4gYSBmaWxlIGdyb3dzIHJlbW90ZWx5LCB0aGUgcGFnZSBz
dHJhZGRsaW5nIHRoZSBvbGQKKwkJICogRU9GIGNvbnRhaW5zIHplcm8tZmlsbCBiZXlvbmQgb2xk
c2l6ZS4gIFRob3NlIHplcm9lcyBhcmUKKwkJICogdmFsaWQgd2hpbGUgaV9zaXplIGVxdWFscyBv
bGRzaXplICh0aGV5IGFyZSBiZXlvbmQgRU9GKSwKKwkJICogYnV0IGJlY29tZSBzdGFsZSBvbmNl
IGlfc2l6ZSBpcyBpbmNyZWFzZWQ6IGNvbmN1cnJlbnQKKwkJICogcmVhZGVycyB3b3VsZCBzZWUg
emVyb2VzIGluc3RlYWQgb2YgdGhlIGRhdGEgd3JpdHRlbiBieQorCQkgKiB0aGUgcmVtb3RlIGhv
c3QuIEV2aWN0IHRoZSBhZmZlY3RlZCBwYWdlKHMpIEJFRk9SRSB1cGRhdGluZworCQkgKiBpX3Np
emUuICBBbnkgcmVhZGVyIHRoYXQgcmUtcG9wdWxhdGVzIHRoZSBjYWNoZSBiZXR3ZWVuIHRoZQor
CQkgKiBpbnZhbGlkYXRpb24gYW5kIHRoZSBpX3NpemUgdXBkYXRlIHdpbGwgaXNzdWUgYSBmcmVz
aAorCQkgKiBGVVNFX1JFQUQgd2l0aCB0aGUgbmV3IGRhdGEgdGhlcmUuCisJCSAqCisJCSAqIFRo
ZXJlIGlzIGEgcmVzaWR1YWwgcmFjZTogYSByZWFkZXIgdGhhdCBoYXMKKwkJICogYWxyZWFkeSBv
YnRhaW5lZCBhIGZvbGlvIHJlZmVyZW5jZSB2aWEgdGhlIGxvY2tsZXNzCisJCSAqIGZpbGVtYXBf
Z2V0X3JlYWRfYmF0Y2goKSBidXQgaGFzIG5vdCB5ZXQgcmVhY2hlZCB0aGUKKwkJICogaV9zaXpl
X3JlYWQoKSBpbiBmaWxlbWFwX3JlYWQoKSB3b3VsZCBob2xkIGEgcmVmIHRoYXQKKwkJICogcHJl
dmVudHMgaW52YWxpZGF0ZV9pbm9kZV9wYWdlczJfcmFuZ2UoKSBmcm9tIGV2aWN0aW5nCisJCSAq
IHRoZSBmb2xpby4gIFRoZSByZWFkZXIgd291bGQgdGhlbiB1c2UgdGhlIG5ldyBpX3NpemUKKwkJ
ICogKHJlYWQgYWZ0ZXIgb3VyIGlfc2l6ZV93cml0ZSkgdG8gY29weSBzdGFsZSBkYXRhLgorCQkg
Ki8KKwkJaWYgKFNfSVNSRUcoaW5vZGUtPmlfbW9kZSkgJiYgYXR0ci0+c2l6ZSA+IG9sZHNpemUp
IHsKKwkJCXNwaW5fdW5sb2NrKCZmaS0+bG9jayk7CisJCQlpbnZhbGlkYXRlX2lub2RlX3BhZ2Vz
Ml9yYW5nZShpbm9kZS0+aV9tYXBwaW5nLAorCQkJCQkJICAgICAgb2xkc2l6ZSA+PiBQQUdFX1NI
SUZULAorCQkJCQkJICAgICAgKGF0dHItPnNpemUgLSAxKSA+PiBQQUdFX1NISUZUKTsKKwkJCXNw
aW5fbG9jaygmZmktPmxvY2spOworCQkJLyoKKwkJCSAqIFJlY2hlY2sg4oCUIGEgd3JpdGUgb3Ig
dHJ1bmNhdGUgbWF5IGhhdmUgc2V0CisJCQkgKiBGVVNFX0lfU0laRV9VTlNUQUJMRSB3aGlsZSB3
ZSBkcm9wcGVkIHRoZSBsb2NrLgorCQkJICovCisJCQlpZiAoIXRlc3RfYml0KEZVU0VfSV9TSVpF
X1VOU1RBQkxFLCAmZmktPnN0YXRlKSkKKwkJCQlpX3NpemVfd3JpdGUoaW5vZGUsIGF0dHItPnNp
emUpOworCQl9IGVsc2UgeworCQkJaV9zaXplX3dyaXRlKGlub2RlLCBhdHRyLT5zaXplKTsKKwkJ
fQorCX0KIAlzcGluX3VubG9jaygmZmktPmxvY2spOwogCiAJaWYgKCFjYWNoZV9tYXNrICYmIFNf
SVNSRUcoaW5vZGUtPmlfbW9kZSkpIHsKLS0gCjIuNDcuMAoK
--00000000000059860a064f8eb8c7--
