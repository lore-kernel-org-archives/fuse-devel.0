Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4213F54D3
	for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787754285; cv=pass; b=X6G8By4o6D2PAGR5weF+Poxzoguv3vZVYyyMeI8eEyWWSecUiR/APkbNV/GX6l5eb2X/jYI2MSmaxjfzJrQYWRUqxAL7sh/KGocFMNy+namgGuzoPcKD9clJNbz0wWsXzHnaHEEKjUgFnWVJa+bfsxT4be/rm1NPvu8ty5cu9Jc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787754285; c=relaxed/simple;
	bh=A0QN/EAqu8XLPFPlccLmBUTZOWgUpFz48lcfU/pPYkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dbCU1hPggLb40q2GUBhWUx+pKT60pSoNck17LpamYfkyHRHK/X/9Mak4hOSE0WcO5h4AFg9QWaHdbfa99MFPp6BfFiEFZfk92bP29BJPK150wGF53qQseZSjqdbYSdn5ZpfDu30JttSWkLdpw9GCPF4Dhv96iKxnL/34F2hkOIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=CLQm77qv; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="CLQm77qv"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so7382521cf.0
        for <fuse-devel@lists.linux.dev>; Wed, 26 Aug 2026 07:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787754283; cv=none;
        d=google.com; s=arc-20260327;
        b=Z8c5jEOEZe7FQ1rpDDi0PJAOgrU3TpvRlMJ1DGWgbErWnTIJ+nM7fmg99KygbZoLBk
         PzGn0q8ELKaSMrFu1VdFj54tk8WDHOIwEcXCNlOfRVpi+lpuBbT5Bh6eZPZeDNK5FNyK
         sz/KRW0v6GKDGneXg+XLkTSN1Kfnrjw+ljjQwCzpbxGEUw5eWCPbXFUvguOjAEQYAsLM
         dVf6HONuIw3eZA1K8rdEIdXsTvsPSNwKSDnOiNUYEpqU2PAJKOHjvN+L+Qda41i7FvcR
         cvoN6Yw5se8qXIKVvUUTGoLxVTJIlGZxu8jgj4P1qXtvwNV+zifxI0opU5f/nSp5slPA
         FKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4zi7ASXYHVtJ5N5oFB5m7S11BPl38SzlWjS+qYhieJI=;
        fh=zNwLqlXIN8TpCA7Tuz5kb+/GNrDh2XGSFmqGj3G5kcs=;
        b=AilibRUdyhVuuVwtI+Db20D5VH07+7DqkS+9fQst5DQF6NFDIbH7PE6e5yH6juU4BI
         7IxcqPnACnVSLRqnLmIl7HWyOT58jzarN3/uVcjFnZRos2rRrkr7uKnGyZuuXs7h3GG6
         e8pVbGYprTcjjcS0UeKyDkJck7nLTbHUkuarVB6tA7abfDK+YQRfJlWJGlVH6oWmBME3
         B+31aFmAq8qzJ9HrFtS+GDQdkmCH2CQKk4o6Tij4F919QBH5bt2PKLBk66C3Lfujx6tL
         Ic9SeHF7JiDIIz0z3doa+3DjLHYwQZ6KBaa0L2JE4WF+d/fDwlahxnSwHotGqqjtSjAq
         Abww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787754283; x=1788359083; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4zi7ASXYHVtJ5N5oFB5m7S11BPl38SzlWjS+qYhieJI=;
        b=CLQm77qvhK3q2s7KFm10R+9v1c/ks1zQribSlE6gBSsvYJ81/J1PKhzGKnAIoHxIty
         VURTKK16CmWBg3R0QxurX4yd5reFkJCVxAOUDsMTSNtwCVYwx0Mgt/jO/5T2YSgny6/U
         EXAd6/Jqd2zA3aQ+HfBESWVAECUtyagckzwjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787754283; x=1788359083;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4zi7ASXYHVtJ5N5oFB5m7S11BPl38SzlWjS+qYhieJI=;
        b=As7H5iu6Jldd5NvI92ppO1mDeqC6e/vrp77IUQXwEALF9EYRsoB+BZYWkVdBuxnYmk
         +LHtVbSPiwq0PjeIvpxKctWtKDQoRdXqNzBAP0KvWfvortFCeieARtoDtMOEXNh48VcV
         g2KW51GWNW+YlUGFLIO58h8tTlbxnuPGC3y7QAPHaPvIoa9GRdac7PehLBL4goZJcopx
         QaqxrOWy6/Es5+jT/nd8MxmrmaK4hrn4LJc/1sVXTrQPSmPv6DWbxg5/o+3bBj1cuxv0
         N3+fDJnYcfQpQbI7qibQHN7ALsMmFa8LTTeBD23hzH3k0gD+Umpg90OjAW4+8JiFxhs7
         lWOA==
X-Gm-Message-State: AFuF++mx/vpqU72/sMxT9P8GWECmWei1IlN9N55nTNAiL+4XNGf9DrsP
	W9tJr866iZevPTfX9RKdM0Nn/qU92Q57/nhqBAI2gu6EedRDxXPtr33NOuA2kvPt8Dbr/JQ54lm
	rQOGFKgaJduIRkYL7ekTbFDH2VXP0sJufVPvkAuOfWg==
X-Gm-Gg: AR+sD10rE4/5/ZXuGDlHDPHau0Q4tZlVHlXYS/8RG0OrBLYj39W01HrHhX9zVE/JXMJ
	qENt8ZybZQI6f8mjld8UgbZqPEmMTIAuS26DLI/Pjie9qDa/7PPhBphWsrklumjlfo2FyUmYuQz
	dgOL35Xu66kS+meCS/xKNOLyXnZwIgS16MTUMW3IvexTE/nW0VUdNmXHbfSm7q4EJnSyRPjNF7V
	uz7n4r6Xe7rfup/dL2pTTxRtTEWeXJxpTk9udsyojPgxW9K79DYA4Vmd0I+uC0sggqvECmiDZwG
	JHfisfpF3ImZ4pab2kuNOpp/LWFKIQUr+q5Yisr77XPXq5RUTU8Q46uPw5InQRDCVbMD3RksUGM
	20yE=
X-Received: by 2002:ac8:7e8d:0:b0:52d:918b:92e2 with SMTP id
 d75a77b69052e-52e4222c9c4mr70297011cf.6.1787754282849; Wed, 26 Aug 2026
 07:24:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706025705.58301-1-laoar.shao@gmail.com>
In-Reply-To: <20260706025705.58301-1-laoar.shao@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 26 Aug 2026 16:24:31 +0200
X-Gm-Features: AcwNN1WSKybzEO-CNbHMiZgkUgE16mM5-sYoVBdlJf8kl45Rl8KA_KwyJ7uLTJ0
Message-ID: <CAJfpeguGzyVctgBRp+JFzs1ohzHG7hZ+EwRokE_yX0w-zJNyMg@mail.gmail.com>
Subject: Re: [RFC PATCH] fuse: fall back to copy_splice_read() when i_size is zero
To: Yafang Shao <laoar.shao@gmail.com>
Cc: fuse-devel@lists.linux.dev, David Howells <dhowells@redhat.com>
Content-Type: multipart/mixed; boundary="000000000000fa2c510659f3fa74"

--000000000000fa2c510659f3fa74
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Jul 2026 at 04:57, Yafang Shao <laoar.shao@gmail.com> wrote:

> While the proper long-term fix is to upgrade lxcfs, the kernel
> should be resilient to this common FUSE daemon behavior. Therefore,
> when i_size is zero, fall back to copy_splice_read() instead of
> filemap_splice_read(). copy_splice_read() calls the file's read_iter
> operation, which sends a FUSE_READ request to the daemon and lets it
> generate the content dynamically. This is safe because for genuinely
> empty files the daemon simply returns 0 bytes.

Thanks for the report and patch.  Naturally the kernel needs to be
fixed in this case, the no-regression rules makes that mandatory.

Can you please try the attached patch?   This is actually fixing
behavior for FOPEN_DIRECT_IO, so if it fixes the regression that would
be wonderful.

Thanks,
Miklos

--000000000000fa2c510659f3fa74
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="fuse-fall-back-to-copy_splice_read-on-FOPEN_DIRECT_I.patch"
Content-Disposition: attachment; 
	filename="fuse-fall-back-to-copy_splice_read-on-FOPEN_DIRECT_I.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mta6py0j0>
X-Attachment-Id: f_mta6py0j0

RnJvbSAyMDEwZWQ3MzI0MzVmN2Q2NWI3MDA3NTk1YzI2M2FkYTljM2JjOGU0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNaWtsb3MgU3plcmVkaSA8bXN6ZXJlZGlAcmVkaGF0LmNvbT4K
RGF0ZTogV2VkLCAyNiBBdWcgMjAyNiAxNjoxMTo1OSArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGZ1
c2U6IGZhbGwgYmFjayB0byBjb3B5X3NwbGljZV9yZWFkKCkgb24gRk9QRU5fRElSRUNUX0lPCgpZ
YWZhbmcgU2hhbyByZXBvcnRzOgoKICAiQWZ0ZXIgdXBncmFkaW5nIHRoZSBrZXJuZWwgZnJvbSA2
LjEueSB0byA2LjE4Lnkgb24gcHJvZHVjdGlvbiBzZXJ2ZXJzLAogIHNvbWUgY29udGFpbmVycyBm
YWlsZWQgdG8gcmVhZCBseGNmcyBkYXRhLiBUaGUgcm9vdCBjYXVzZSBpcyB0aGF0IG91cgogIGx4
Y2ZzIGlzIHN0aWxsIGF0IHRoZSBvbGQgdjMuMC40LCB3aGljaCBkb2VzIG5vdCBpbmNsdWRlIGNv
bW1pdCAyNTk4MmY1CiAgKCJTZXQgdGhlIGZpbGUgc2l6ZSB0byA0ayIpIFswXS4KCiAgQmV0d2Vl
biA2LjEueSBhbmQgNi4xOC55LCB0aGUgRlVTRSBzcGxpY2VfcmVhZCBwYXRoIHdhcyBjb252ZXJ0
ZWQgZnJvbQogIGdlbmVyaWNfZmlsZV9zcGxpY2VfcmVhZCgpIHRvIGZpbGVtYXBfc3BsaWNlX3Jl
YWQoKSBieSBjb21taXQKICAyY2IxZTA4OTg1ZTMgKCJzcGxpY2U6IFVzZSBmaWxlbWFwX3NwbGlj
ZV9yZWFkKCkgaW5zdGVhZCBvZgogIGdlbmVyaWNfZmlsZV9zcGxpY2VfcmVhZCgpIikuIFVubGlr
ZSBnZW5lcmljX2ZpbGVfc3BsaWNlX3JlYWQoKSwKICBmaWxlbWFwX3NwbGljZV9yZWFkKCkgc3Ry
aWN0bHkgY2hlY2tzIGlfc2l6ZSBhbmQgcmVmdXNlcyB0byByZWFkIGZyb20KICB6ZXJvLXNpemUg
ZmlsZXMsIHdoaWNoIGJyZWFrcyB2aXJ0dWFsIEZVU0UgZmlsZXN5c3RlbXMgbGlrZSB0aGUgb2xk
CiAgbHhjZnMuIgoKRml4IGJ5IHVzaW5nIGNvcHlfc3BsaWNlX3JlYWQoKSBmb3IgdGhlIEZPUEVO
X0RJUkVDVF9JTyBjYXNlLCBqdXN0IGxpa2UgdGhlClZGUyBkb2VzIGZvciBEQVggYW5kIE9fRElS
RUNUIGZpbGVzLgoKUmVwb3J0ZWQtYnk6IFlhZmFuZyBTaGFvIDxsYW9hci5zaGFvQGdtYWlsLmNv
bT4KQ2xvc2VzOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA3MDYwMjU3MDUuNTgz
MDEtMS1sYW9hci5zaGFvQGdtYWlsLmNvbS8KRml4ZXM6IDJjYjFlMDg5ODVlMyAoInNwbGljZTog
VXNlIGZpbGVtYXBfc3BsaWNlX3JlYWQoKSBpbnN0ZWFkIG9mIGdlbmVyaWNfZmlsZV9zcGxpY2Vf
cmVhZCgpIikKU2lnbmVkLW9mZi1ieTogTWlrbG9zIFN6ZXJlZGkgPG1zemVyZWRpQHJlZGhhdC5j
b20+Ci0tLQogZnMvZnVzZS9maWxlLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZnMvZnVzZS9maWxlLmMgYi9m
cy9mdXNlL2ZpbGUuYwppbmRleCBmYjVlYzAwZGFiMzMuLmM2YjZkYTM5NWNiZSAxMDA2NDQKLS0t
IGEvZnMvZnVzZS9maWxlLmMKKysrIGIvZnMvZnVzZS9maWxlLmMKQEAgLTE4NzQsNyArMTg3NCwx
MCBAQCBzdGF0aWMgc3NpemVfdCBmdXNlX3NwbGljZV9yZWFkKHN0cnVjdCBmaWxlICppbiwgbG9m
Zl90ICpwcG9zLAogCXN0cnVjdCBmdXNlX2ZpbGUgKmZmID0gaW4tPnByaXZhdGVfZGF0YTsKIAog
CS8qIEZPUEVOX0RJUkVDVF9JTyBvdmVycmlkZXMgRk9QRU5fUEFTU1RIUk9VR0ggKi8KLQlpZiAo
ZnVzZV9maWxlX3Bhc3N0aHJvdWdoKGZmKSAmJiAhKGZmLT5vcGVuX2ZsYWdzICYgRk9QRU5fRElS
RUNUX0lPKSkKKworCWlmIChmZi0+b3Blbl9mbGFncyAmIEZPUEVOX0RJUkVDVF9JTykKKwkJcmV0
dXJuIGNvcHlfc3BsaWNlX3JlYWQoaW4sIHBwb3MsIHBpcGUsIGxlbiwgZmxhZ3MpOworCWVsc2Ug
aWYgKGZ1c2VfZmlsZV9wYXNzdGhyb3VnaChmZikpCiAJCXJldHVybiBmdXNlX3Bhc3N0aHJvdWdo
X3NwbGljZV9yZWFkKGluLCBwcG9zLCBwaXBlLCBsZW4sIGZsYWdzKTsKIAllbHNlCiAJCXJldHVy
biBmaWxlbWFwX3NwbGljZV9yZWFkKGluLCBwcG9zLCBwaXBlLCBsZW4sIGZsYWdzKTsKLS0gCjIu
NTQuMAoK
--000000000000fa2c510659f3fa74--
