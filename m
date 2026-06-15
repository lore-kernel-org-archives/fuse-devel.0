Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4691C3F1ACA
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529125; cv=pass; b=B5hJBAFhT5szt255BvZnpAhEs5ersbsMCE1j1u2s+RaMlZx4FyfbEwcXZKM0oUBUPapxXF1vdi3kqtdfdzn05QuwvbbXeiB0pDjbdexpvMj0wX1RBC0rl7TAjmhdZjkQzSkFThWmeh0pn+vkLISTDg453fBTH5RUaS7Wsxvx1JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529125; c=relaxed/simple;
	bh=kKNBiJvc+rzdgShKrG5gbJxYUuppXn+sgk4q2LkXCxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr63AfuOtkGZ+c4vejZk2PPgCDkYxSYFKcPJGtrSNK1xnnhiwJBmX7wFDlH8I/+fEOdFbAdp7LLUXbs0maKwm6WNG2snXuiErfH2p6nL5rzQaxIHivS47NogJaPAOG/c78ZxSJNMNzhz84faCnFnzottXTifRMavBIwrWRGnYXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdHG/JGL; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdHG/JGL"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45efb698ef2so1702108f8f.3
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 06:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781529123; cv=none;
        d=google.com; s=arc-20240605;
        b=iEc/pYIav52Kq/RCgBKhKkH+POxb9EsCqZfIelXC4ySVxLdsSNIfcE6AH8QZDnE9+k
         z92mrN7R4to5LUrEUxOxVzXFhRCA/OWL2zv46yhke5T4JWq5dOGqnQ+0UbJ5Tfki4riO
         n+38ywNfEU7U1HDhMlacr1r3cjZVCqBnfCqPrfBXw4gB/O7cOcLUOkVMjU2JNREjRvsg
         ACKjQxe+QZteKpOooOh3ooYejI/FME54bdapbHSs1Q74Pn28437HgmZMLfDNlcx6ifUN
         +MdAcOCATOjr1xtb0T741ClPCRtLMoYdBWAvouUbLlS5/134YnGFGDBwX2wckNoVCH/a
         MT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kKNBiJvc+rzdgShKrG5gbJxYUuppXn+sgk4q2LkXCxM=;
        fh=GGaIzO8/xUVze/Nwiz5Oll3MkWpGEmgs9y3wa/PRBXY=;
        b=kzeCDpWsuvZjCtKhMuMnMqfvGYLU8+EbmSOE6OtrXcrsVb/S6G2BFXITIpa6e5/5/8
         +ZXCuO0loLVe5NlJNe5pr7xlsCblnb5UwOKf1+t3yN/X7cuArUXTg2aR5r6Zhm8gnR/4
         TvqpXqLkMUuAgxFgoA3xyT7i1CpHM71QThsjQn8MPEol2gNo5wgOpv/2IW+pSyR2KWTX
         jRocycUydK2IDco+HtbZGaH5zSt+5jxDpE68x98g5mPIJ+hCYZLVBuLK8GlL1SPxTonY
         hrHO4W507O6Tt4n6XZRHuEN8QDQ2GvZ8gNwDYh83XX4+16eD6EZcVRcVL+CKZSBV14lg
         Sw/w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781529123; x=1782133923; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKNBiJvc+rzdgShKrG5gbJxYUuppXn+sgk4q2LkXCxM=;
        b=BdHG/JGLXi1yCHP4CwPyt4YH9FkwWFSBrtTHLayDNomTD+e6sZL3OcDf1erNDL+zuF
         ZXDf74zW5dZrFytR2TjAhdtKFrBoGeeN0Hvwy0wo1onHdLiH1xyR+kkB+dGv9vOYwIX+
         rP8nJ9mAxeYRQx2j+ieTQtsm3C/fmWkK9jCK5CaQ6J9I2gvTJ+7LIv/Tn9asRrXQs2ms
         lkCRyrLntQuzQJNx4BNXmSiq1smscHbk00mY9+zZ7XK3P7CAW6xB2R7vo06hpfEqrsVB
         A15x1dDACOzE7p2WxhTd0+2XD9SWBUtVyNLgP0YPaiT4m8AKwDuixfTfEUKLkCViqsvg
         4QNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529123; x=1782133923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKNBiJvc+rzdgShKrG5gbJxYUuppXn+sgk4q2LkXCxM=;
        b=qEDA8qjkRupDnc9ETOm+ZzOvqmlpCGqXJzaeD+zyO2V30MpSAWf5Ls+RXfXD18z+lh
         qn8Bqr6pLbOTVLwDiHRYdL4FQgpkiAW/hj9f5fLmbM0Q190yYoRAvL3qmFfDhQOWXlAt
         1UaiJ5YXArVAfUZ8AtbVXVM9D86KnZ+vqxkj5JP7//JVRfVoQGYIIYgZhsrlmP2HnJRI
         V+WcABDjCdOZgdVL/Dzzh6foUkN3UB3iMqLC4qqzAQX4IabtFc0X+Tq2q8dmgwxORV4D
         A7expRmOsBAxUvMAFwMpKg201Hj+nH+MtG28WZWvI0hP8c5XJk80Pc4ATANPAy56EvzK
         jjrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vPJyj8q+PWL1mqN1vv4PDJc/lYpK3XlyYb5dNY5tNceBD3rq8twhONlibjJKeaf5ZuptLZodv2aNW@lists.linux.dev
X-Gm-Message-State: AOJu0YxI6kt0hzNNAs6JsTC0IOo2pRM7sIKr9g5NfgqBYNdW9QB4U51a
	rRX6hih63gLiDD91pqHHqLmp9TQ8H5A0h8bCFwyS3pIM3iB/h7MwuyOR9fm0L1OItWNM17RxQ2m
	KHO8K+AQVJywBWCFgYhacij+eDlSpmH0=
X-Gm-Gg: Acq92OH8rzQH40M7WJkPMb8uLJv2fhFBorzURgx3uXIdp7pPj0hZ76u8hoNv1DemCII
	mDgOZi9LHK6286D9YGvE6P8GpHGkCuqYGFy7w6qkIzeVo96s60cXtA2u8yocq39WKBimGmIhMPv
	sfHfHpSHIk0wxJGcOamB99oGN+pYoAsE0rIb04ym5snZSNw8Pk87tqEllsGzMb5SHFbmJKdpBZK
	Vvegb0Xhmg5w4CTVr3oB+5P56MVQqyNr32c517dv5QIMkf+h9l3IQjYxtxX2L9XuJ5AJl60bMW3
	MpTYhGndeXS3eQqWBgZO8MRi2ws6EpFedE+m5X3ZdEfTF1UZCbOaA1s+WByS/JRBXCQ=
X-Received: by 2002:a05:6000:1842:b0:45e:eec6:500c with SMTP id
 ffacd0b85a97d-46074b8a1a8mr14546144f8f.39.1781529122279; Mon, 15 Jun 2026
 06:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531010107.1953702-1-safinaskar@gmail.com>
 <20260601-enthusiasmus-canceln-anlehnen-0e62317a9784@brauner>
 <CAHk-=wifX_rrDjRGnDnOqE-usptAukuXKrmuPuVDP5bOCBWzGQ@mail.gmail.com>
 <20260601173325.GH2636677@ZenIV> <83f05c55-efba-4bf5-abfe-d2ab0819e904@packett.cool>
In-Reply-To: <83f05c55-efba-4bf5-abfe-d2ab0819e904@packett.cool>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 15 Jun 2026 09:11:49 -0400
X-Gm-Features: AVVi8CeKgoUdgzfGyE3gGhvo39veJuptxa85IFXCJ5UZu0W-8unFPPqkk0CT60c
Message-ID: <CAJnrk1Y9egYizkx1H9K0cqxSYuB+7vLvQbV7Tf4C5eHFqnnC-A@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Val Packett <val@packett.cool>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Christian Brauner <brauner@kernel.org>, Askar Safin <safinaskar@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-api@vger.kernel.org, netdev@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, David Howells <dhowells@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, Miklos Szeredi <miklos@szeredi.hu>, patches@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, fuse-devel <fuse-devel@lists.linux.dev>, 
	Bernd Schubert <bernd@bsbernd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 2:25=E2=80=AFAM Val Packett <val@packett.cool> wrot=
e:
>
> Hi,
>
> On 6/1/26 2:33 PM, Al Viro wrote:
> > On Mon, Jun 01, 2026 at 10:17:23AM -0700, Linus Torvalds wrote:
> >
> >> TLDR: maybe we could ghet rid of "f_op->splice_read". *That* would be
> >> a big simplification.
> > FUSE might be interesting - fuse_dev_splice_read() and its ilk.
> > Communications between the kernel and fuse server at least used to
> > seriously want that, so that would be one place to look for unhappy
> > userland...
>
> speaking of fuse_dev_splice=E2=80=A6=E2=80=A6_write actually, this series=
 has broken
> xdg-document-portal!
>
> https://github.com/flatpak/xdg-desktop-portal/issues/2026
>
> Specifically what happens is that the EINVAL is returned due to oh.len
> !=3D nbytes:
>
> fuse_dev_do_write: oh.len 16400 !=3D nbytes 15526
>
> (where 16400 =3D=3D 16384 (read len) + 16, 15526 =3D=3D 15510 (file len) =
+ 16)
>
> After reverting the series, there is no error because oh.len
> becomes 15526 too.

I think this is because of how libfuse handles eof / short reads. When
it detects a short read, it fixes up the header length after the
header was already vmspliced to the pipe because it assumes vmsplice
mapped the header's page into the pipe by reference. It assumes that
modifying the header length in place gets then reflected in what the
pipe later splices out.

The logic for this happens in fuse_send_data_iov() [1]:
a) sets out->len =3D headerlen (16) + len (16384) =3D 16400 in the
stack-allocated fuse_out_header
b) vmsplices the header to the pipe
c) splices the backing file to the pipe. if this hits EOF, it'll get
back 15510 instead of 16384
d) detects the short read [2], fixes up the stack out->len =3D 16 + 15510 =
=3D 15526
e) splices the pipe to /dev/fuse

After this patch, step b) is a straight copy which means step d)'s
fixup doesn't modify what's in the pipe. This could be fixed up in
libfuse to not depend on modify-after-vmsplice, but I don't think this
helps for applications using already-released libfuse versions. I
think this patch needs to be reverted.

Thanks,
Joanne

[1] https://github.com/libfuse/libfuse/blob/master/lib/fuse_lowlevel.c#L846
[2] https://github.com/libfuse/libfuse/blob/master/lib/fuse_lowlevel.c#L956

>
>
> Thanks,
> ~val
>
