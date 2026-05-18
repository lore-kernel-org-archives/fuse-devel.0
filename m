Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2719C38AC90
	for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 18:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127491; cv=pass; b=KGWsxZZqCDd4GkzalsEdxD5QxIZrYU2Yiy6uUPGnIf+tVA7noql141j8LI8Arc7X58gJ5/RKDD94EzBru3z4aRZxkm9L7h8I+/2aGEXKIFLnuGv1+wSvR+qxMLcCO9ydzfQ68CvsFo6cMdSQuofitaM/W/CeVfs9Dmma0SdwXDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127491; c=relaxed/simple;
	bh=kDDg6N0nN6KEff1emIwXgNf3VdPR+RZcL3mDcfSvr60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYP1HW11xWnjT/RiCozVYCME60A5ca+Jq8BBbtnZGR6B73xN40bwTHjPUWq29/DL4wV2Fyk/BcDhVNNiymTW4vpzEyGFb8YGtIDPzenzIem5Z2MQMf65EZVRu6NrAWsMKabQ5JIzOUKP1CyVYEwZw1KmOLoPtA4lhcD5lx9Jm74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhTQ0XkS; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhTQ0XkS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d75312379so2403569f8f.1
        for <fuse-devel@lists.linux.dev>; Mon, 18 May 2026 11:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779127488; cv=none;
        d=google.com; s=arc-20240605;
        b=cZ9RazKdnN7oQPWf7BLwQobLktwR5PXCGckHqNj4Fox4LwKeP5K2MVj5ywVip4HNg3
         rV+EukGFbnQqSLQYKyCE4E195mXhcYjlVrJK2snQrqm6U5BO3HOuFTTvVeg2faGTDoN1
         5NjHgcVFPog1kA0PP4Y6za6vBcN9L7mOh28QXQ/QpFlJwyQov0zf49nF7WpUELjunTTd
         Nf7ZjK4xyVldFUdeD+DUamZE5pX3TdB/IxQ4Uvpv1zRk9qmD93T4tZXN6qnAbMXy36aV
         ZXk2XD29zH1kl8QPflZLZXI1wRadAXgb04WCnnY7R34uwFoLGErJBm0Mx5WCYkgdWq7e
         gk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CljLoIYskFigaXEtOn3tL+BNQgFNUCP9mu4XODfMHjI=;
        fh=Bn4csD9ra/4yIGXdSfmbEiUSj2n1DfojCmh6j04maak=;
        b=baVyUYLYNBoLU51kYNsTkr69h9MGyo6RBGOUUGHWz43AjfbHzWAOrsRY+FZLcLpOl3
         bP0QcLTVMen8vFIlI+6pwhIKMG2ayuFZ4gmxiiIsHbAkgTE2Q7K/V/OkbDNkwJBstUSV
         9ZP1zlSj5ugLxfMaG9Ek3CIHgdJJANe/JXAs0Gnz9b8kL+mSUQmdbSukOluNtI6qoXqr
         CN6J9L7ZCxlM8jKRiY7ExFxLeVsK7y+LQclCUH2cYX8Mm4jKoelrM4gYlAHxCHRRZXBg
         EucGLWfsINK3XCRARDuTVT+b/NJ9Zl6LKcplj5URN2fupaAaYWNOCF3h5J/Np2qB0x6j
         p6Zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779127488; x=1779732288; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CljLoIYskFigaXEtOn3tL+BNQgFNUCP9mu4XODfMHjI=;
        b=JhTQ0XkSWCbf1C7DRS0S3uL/1C002vnJLkpWgDNVLSgkIF2XzUZXxD4WVl1tW2TnZS
         o6GVHPYnyfTKDPnxS9Lehzb1cTjIfRxoki/yZC8mY+j/vd6+T+bS3snmTCYOzEwP3ZBL
         pFZcSKzRSg2JTgZtwk72kAnyo7JZK9tSmHzuwtsGhnO6Bobh96LVPCb1C4cpWA43rkMr
         ac3LRx0w6ZVM5FyjE5YLUlbAUbfVfepKPQ5+jSHoB0pCJtG/CwbbbQA1Obi4SOYgfE1J
         SYrgf6sg2Kz1SHl0/AF7i0euUHJnrppznDp3BpPSscutias7MiAkTcVmyhjjDqyimbY7
         TUjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127488; x=1779732288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CljLoIYskFigaXEtOn3tL+BNQgFNUCP9mu4XODfMHjI=;
        b=XBSmvvQSeFb2P0aN3QmzPKc6aZUjy5+jR/fxnbc4uRT1c7KJyGobAZhcHveDXbBSoi
         Tmdc9V+P++/a/aLuw6mtHt2CCYBGLuooPyOrPb59JOmBjMxuBIOmM5kKvUH/kp1B3wCp
         AJ6ThVlYnI5Rol3+AzXCAmpKnDQgDTpFBJdq7yqDHqpJIE4U1dHZ6jUQOiHC6aB4VLHo
         Ewg+IGncQk5TjvWIHuEuDGSIM9RmJvHfd4CQYCouJeA9uquefw1samMXfBK8/dG12Fr+
         xF6yz01nd2/TWgKdy1a47LU5gEr++7e5WD23s6bYhZqjAQfRHQLfwHUfSLni7/Ts/BwU
         4M4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/20Hc8q4X7wV8I2sykGZ62BLdCHz2UP5AZN8HZV0lCxoW4vrWgfLVZTuQibcMxOKJEBDlUD3BVsE2H@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2Xei3xX59WHclht54pSmXZZk8/w4/LENIJ9S941STZKaV/Vb/
	7wjEm6hNbBdxk/mevmz6jfqZiAcH1ZxSHgHqu8Uj79AnlQpJSMbOBlMVQtLRU3qu0TGJnrs3s9C
	m8Q18l5bTlihYRuYOPlxQY0TZO9kzrUs=
X-Gm-Gg: Acq92OGVt+350hBXQEr2Iy5WZJu6cTNCm/pkCdjKNilqk47aIp+jBn7E7s+CeKiSpFJ
	Yr53NpirZS/XNKVe8M0Np3YGD5Ke/codnhnmwLnaLlINGjZ7A6Ulr8CA8Kt0AByApFf9xHOSIrz
	T/jiiNtSmwo4YxNvCAS3O5m61666oqtQ/VwsyFvdG8ojRmNCbroIJ5+8lRSNrRv6PlpFi0UKfvu
	Xtv96iyT0FhCUo6ELZlj4leQSuwcKs9wZ7gvKsEsNLg0GQI8sHb9VLTfxIoFZxedPRwri4qDKbp
	qftCcEiVvr2H+mbQ
X-Received: by 2002:a05:6000:42c2:b0:456:d742:8b4f with SMTP id
 ffacd0b85a97d-45d91438680mr21134881f8f.12.1779127488214; Mon, 18 May 2026
 11:04:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260516004004.1455526-1-joannelkoong@gmail.com>
 <20260516004004.1455526-3-joannelkoong@gmail.com> <CAJnrk1YUjqd+j1yLXuO0M07ueCUYNC0NqgwmQSm3OiY3hnhgZQ@mail.gmail.com>
 <CAOQ4uxhyZU_6jbv8kY8od_SgG9yQ6aX+KcB2c1um4DajJdSPqA@mail.gmail.com>
In-Reply-To: <CAOQ4uxhyZU_6jbv8kY8od_SgG9yQ6aX+KcB2c1um4DajJdSPqA@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 18 May 2026 11:04:36 -0700
X-Gm-Features: AVHnY4LHIzzo9vmjpUtLlchtf0O-41uZhMAUHOsNmTtLXcemqB7KqU8vLK1LXnU
Message-ID: <CAJnrk1aEc1nf7ax0UvdCi7rkzbWDFpgjJcE35HCQyWcPLdoOnw@mail.gmail.com>
Subject: Re: [PATCH v2 02/21] fuse: prepare for passthrough of inode operations
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-unionfs@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 9:11=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Sat, May 16, 2026 at 3:34=E2=80=AFAM Joanne Koong <joannelkoong@gmail.=
com> wrote:
> >
> > On Fri, May 15, 2026 at 5:52=E2=80=AFPM Joanne Koong <joannelkoong@gmai=
l.com> wrote:
> > >
> > > +/* op bits for fuse_backing_map ops_mask */
> > > +#define FUSE_PASSTHROUGH_OP_READ       FUSE_PASSTHROUGH_OP(FUSE_READ=
)
> > > +#define FUSE_PASSTHROUGH_OP_WRITE      FUSE_PASSTHROUGH_OP(FUSE_WRIT=
E)
> >
> > Do you think we should couple the passthrough op code to the fuse
> > opcode so closely, instead of defining the passthrough ops separately,
> > eg doing something like this?:
> >
> > #define FUSE_PASSTHROUGH_READ         (1 << 0)
> > #define FUSE_PASSTHROUGH_WRITE       (1 << 1)
>
> Don't drop the _OP_ please
> Need it to distinguish from FUSE_PASSTHROUGH{,_INO}
> and we need to think if we want to format this as 32bit and extend later
> or start with a u64 ops_mask format from the start.
>
> >
> > In the (far) future when some more advanced passthrough features get
> > added (eg full subtree passthrough), it seems like we'd want to add a
> > passthrough op for that,
>
> I don't know. fuse_backing_map has flags, why would we want to put that
> in ops_mask.

That's a good point, I like your idea of using flags for that.

>
> > but that wouldn't map to a fuse op. I think
> > there are also some fuse ops we might skip defining as passthrough ops
> > but are implicitly passed through (eg FUSE_STATX which is covered by
> > FUSE_GETATTR),
>
> This could also become the case with FUSE_CREATE{,_HANDLE}
> or {FUSE,FUSEX}_CREAT.
>
> TBH, the fact that some ops will never be in the mask and
> that some ops have a canonical bit in itself does not justify creating
> a different mapping. Do we also want to squeeze the mask into 32bit
> and leave reserved space? my intuition is to leave it u64.
>
> > so it seems more intuitive to define the passthrough
> > ops as describing capabilities rather than implying that it describes
> > what specific opcodes get passed through?
>
> hmm. I guess you have a point that it is a bit limiting to commit
> to this arithmetic in UAPI.
>
> My thinking behind this was ease of use with these helpers:
>
>        if (!fuse_passthrough_op(file_inode(in), FUSE_READ))
>
> but those could just as well be macros:
>
> static inline bool fuse_inode_passthrough_op(struct inode *inode,
>                                             u64 opbit)...
>
> #define FUSE_PASSTHROUGH_OP(inode, opname)    \
>              fuse_passthrough_op(inode, FUSE_PASSTHROUGH_OP_ ## opname)
>
> #define FUSE_BACKING_MAP_OP(map, opname) \
>        ((map)->ops_mask & FUSE_PASSTHROUGH_OP ## opname))
>
> ...
>        if (!FUSE_PASSTHROUGH_OP(file_inode(in), READ))
>
> wdyt?

Nice, the macro idea is neat!

I feel like it gives more flexibility to define it separately and I
think with that, u32 would be more than enough bits as well. But I'm
happy to go with what you think would be better here.

Thanks,
Joanne

>
> Thanks,
> Amir.
