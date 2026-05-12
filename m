Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BED22F8BF0
	for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778607215; cv=pass; b=CO5Ut1W6DM1miH1FC0YKUbCCgSFwIdO+pA02Ymbm7y3UKsMbdJqjSreNS2SfLWFdOcJomPxI9S+KYQbFE6gRSCfkTv73y+Ms7Jnk3qD0fQTOQpu7F6O53vIdNza/WVzrOETHgFLQPXdzzfZgkDOIu7+RLDkW7lueAOfJnI063wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778607215; c=relaxed/simple;
	bh=bx1ALw++qxDz4TNZohgE9siVkcyKnijRmQ6zSVOuvCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zq5gi84kF8jAve5pq3ksC2yKeYkSkbjbneHDMibJwfvCnrTia1YHZ1hp3AKQvoya+kKc23Xwh/7BDi40VjeajrkOd4H78BhzGsDfdhEhzz9GEwsMJATwXoRiwz5GugaOci8o+6by0FVC+dDiVv75BboMszrxpFEoe97reYFrn5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkwDxUXa; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkwDxUXa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44b052142e1so3275308f8f.1
        for <fuse-devel@lists.linux.dev>; Tue, 12 May 2026 10:33:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778607213; cv=none;
        d=google.com; s=arc-20240605;
        b=JRa++/mETGqfqNIzlJiyT202Z/zRw0jvxlFqobJQ1uF67/t6+ZDMUKqZUGykeh5H10
         wO3ieuFP6XSn9A5mTuKjRFcGeZ3C+1pC+bKzk9vzfHAwzdbDlyXtgaDDWHIYzwifgbRI
         WOEE6CJJI5DXn6Wjli1jYZKtR6onypvxDP5HWiY1+d2nQZNk/QJvb5o4ImIwDTZlo5LB
         s0SGyt/FEdYadCe80PV7bfpkVMm0LbQNHzZQsZQDR8fO4e4OLJCtPDebFs6WmvC8/ZfK
         Qwx9DiFNldYEKgNJDD2g6WkerFkhrjhKI2zOdgG4/9aFvUskBHYSwbWnnfmhpyy6etON
         x9mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H/0sPaYMmGoBFflRfz/2Lij5pJssu3sZGPvBsHgCT6E=;
        fh=9onzt5ANPXrQwZvdDMrysY47qOHgaeuTdatZEO2Vyq0=;
        b=GlHRQTwRb+Bquwv+gZLlsJ91xAm3sQIx/sGAo1KuOBXaWRnC5/Cw68LbibrsrdNMR0
         3GJyLVHiZhrfcgx/gAn/KYcZstXKtKdcXHI3OuY+SaerxvkmAxQeRzxuiv8vNdazNJFk
         wJa88ue9Xirs91wboeoAWPMxLukjv3FuhQLrlzFPiUSebO8xQZMhizYqmoEept1FiAO7
         rNmT1PaGDRlUt0eeJtNquVIxhIbv5hXJr+HBndAvtXWY8C5KGvOm3gVFumCudrD/vh8N
         1oQW2iBU6p23QwfwsIaLFxDhcrlHkrggCpxKzgQ2p959ZybtOdIwZ5eAH9SqgVxwVImT
         2qOQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778607213; x=1779212013; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/0sPaYMmGoBFflRfz/2Lij5pJssu3sZGPvBsHgCT6E=;
        b=rkwDxUXaYq/YdKMhsPByAT/6BTuJMwFFo3zC5iytEqMWafjXGUrrLUW72GVCr78d8M
         sGYwofkV6Ajosg23YKvUpKRWPlHTXGlVKVjtwlccmqocLBMl1OWIwtijfi8tEvcufOn2
         NTUIGwRtL5YXQnSmeubPBI+FAUT7gzzxDRudKnoCJ4bvfFgO70Vjd/T8BndNFAiNeFUd
         SkH+F/IbGHYJaVX3nz1OzptibsLS2iU2q2nMpgUuYPiFjBXndXY1avggdNzC9ys0Kl2h
         QjzUu4zO9JXJVBnboYkdKZlcvSPH+eoebItSdn11JcLfnkcY1rTXr5HD3idS4IeUxnZZ
         qd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778607213; x=1779212013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/0sPaYMmGoBFflRfz/2Lij5pJssu3sZGPvBsHgCT6E=;
        b=iqscqkvUHJdr9KMAKdMl4zBBVlzGCukZkq1zOJDtW4zg7dW8Jgf7j/zWZef+GUWFdc
         U/o8IF4nRZmiduP4jx7qC4IttlyUbAn1fRBhWrmG9W0Ac4l3Jon+CNZ0slsMQ1OOwBMK
         Uz5sQHP7Bqc9Hg6bDwZShMn/tT73wJ+S2voXzxHVmvRU/Gzw+DlNMzhMjjHVFcT3Yuis
         BxKqHnkm0gCTMTM6b37DVhMkFlD6F2/UKcBRyOcio5Dq+JV2lA9t+7/ErjrY/F+hVQ+C
         gbXPo6tRTqgCZDBlw6aWtfT6A6BlYv/KbcN0RbFufDbAkkm4WhToAtweMxqpg0JXMDk/
         Hm8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9OFwkt2DNvibrWFlTk6CkPRCvZp7HVxeWkUdoms7f1XCoJu1Y0tXLMJZd/IetlGgUxWyeur4agprpM@lists.linux.dev
X-Gm-Message-State: AOJu0YzeR0KMDwwzBE7/MARopWXIh/a6qvhraPYl8JP8QezoT9v8FBM3
	Zi1bXaWib7GXEwUoBYHfSE/JHpeCG/SsgeYPyTAovdSFAIvwvu8T+mhRthhKpU3+igAp5bd862P
	+UnYPm7JCae8eqzqzLCCERSWMJ6EuF6o=
X-Gm-Gg: Acq92OE8ut953uJMIBsvE5J70dqaLPI41oRIuVb6UMxpg1Pz9FdE8VBxy8JZVNFyr2R
	Wzp94+YXkcsd5jcEYf07HYCSwi0oMdApHcrrQD9xsWYo/YkejoZ1XudfY5HbN9h8S7wj3YZL7x5
	yo9eep/CdKVageqqAHoSmk/3VpuE4mVujJOToOSAIZX0RbzOAXP8efXwb4vJGZOujkVoPgABGMQ
	qV6T+h+Y2G/FOg6elrxG2ox0uRmXpmYWQy35NPbheCt4JRP/I9GDwtF9BFTssD9oLI/IRkFXN4h
	p7V8oQ==
X-Received: by 2002:a05:6000:2681:b0:451:3b12:9bca with SMTP id
 ffacd0b85a97d-4568c19cfe8mr22719758f8f.25.1778607212540; Tue, 12 May 2026
 10:33:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260429102058.1362965-1-mszeredi@redhat.com> <CAJnrk1Z_JWtuA3UjucF9=YH63AH_-J_0hzr9jbY99Hx3O8YrAw@mail.gmail.com>
 <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
In-Reply-To: <CAJfpegspraqMp1Z3mi_csiw6haawZPa4zWheSUN7MhBy47aYKQ@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 12 May 2026 10:33:20 -0700
X-Gm-Features: AVHnY4Ky6JxxgiwpbdhVNQQpmXajlM2ggWvSqKiAo42kFpwU2nzT2qIZUpPGVkE
Message-ID: <CAJnrk1Z+Y2SJ7o-Ms8s9OfEutsYefbQTjRYXBfy3BhWw1hWqAA@mail.gmail.com>
Subject: Re: [PATCH] fuse: add fusex filesystem
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 2:18=E2=80=AFAM Miklos Szeredi <miklos@szeredi.hu> =
wrote:
>
> On Tue, 12 May 2026 at 07:05, Joanne Koong <joannelkoong@gmail.com> wrote=
:
>
> > If it's mostly to clean up interfaces that are now clunky/stale, I
> > wonder if now is the best time given that, as Amir phrased it in [1],
> > "FUSE is experiencing a renaissance of new features and protocol
> > enhancements", and I'm not sure if we know yet if these new interfaces
> > will also have some things we'll have wished in hindsight we had done
> > differently, especially since some of these new features are still
> > actively evolving and gaining new capabilities (including io-uring and
> > passthrough). Would it make sense to let these new features and
> > protocol enhancements evolve and stabilize first before baking them
> > into fusex?
>
> Excellent point.
>
> Currently fusex concerns only the filesystem layer, and is agnostic to
> the transport layer (except maybe the SYNC_INIT thing).  That doesn't

As soon as fusex lands, doesn't this mean with the linux backwards
compatibility policy that any user-facing transport layer decisions
are also locked in? Or is the uapi for it still able to change later
because fusex is marked as "experimental"?

> mean that we shouldn't have the same API cleanup in the transport
> layer as well.  For example, I'd love to get rid of splice on
> /dev/fuse, which I feel is more burden than blessing.  And I guess
> fuse-uring could also do with an API cleanup.
>
> As to when and how this should be done?  I guess that's up to you and
> Bernd to decide.
>
> But I feel that we do need to have more high level discussion of APIs,
> if we want to avoid repeating past mistakes.
>
> >
> > >  - only no-open mode
> > >  - new requests:
> > >    + FUSE_LOOKUP_ROOT - return nodeid of root
> > >    + FUSE_LOOKUPX - FUSE_LOOKUP without the getattr
> >
> > Could you explain why it's preferred to have lookup disentangled from
> > attributes, eg why compounding lookup + attribute fetching is
> > preferred over embedding the statx directly inside the lookup request
> > without compounding? it was brought up in Luis's lookup handles
> > patchset [2] but it's still a bit unclear to me why compounding the
> > two is better. I think every operation/request that returns a struct
> > fuse_entry_out uses the attributes immediately after through
> > fuse_iget(..., &outarg->attr, ...) or fuse_change_attributes(...,
> > &outarg.attr, ...),
>
> That's one argument for decoupling: why include the same fields
> (attributes, validity) in several ops (LOOKUP_ROOT, LOOKUPX, MKOBJX)
> if we already have a separate one to do that?  It simplifies the
> protocol.  If we started with decoupled GETATTR, then we wouldn't be
> taking about adding these X versions, because it would be a simple
> GETATTR -> STATX conversion.
>
> There's also an interesting side effect of coupling STATX with LOOKUP,
> which is inherently racy:
>
> Thread A:
> send LOOKUP + STATX for /fuse/dir1/filea
> [server performs lookup and statx, sends reply]
>
> Thread B:
> send SETATTR for /fuse/dir2/fileb, which is hard linked to /fuse/dir1/fil=
ea
> evict inode for /fuse/dir2/fileb
>
> Thread A:
> looks up inode for /fuse/dir1/filea in cache, doesn't find any
> creates inode, fills stale attributes
>
> This issue is currently solved with fc->evict_ctr in regular fuse, but
> works fine without any additional checks in fusex because of the
> decoupled ops.
>
> Of course, it is probably desirable to compound LOOKUP with STATX
> despite this, but it gives the implementation more leeway  (e.g. on a
> different OS).
>
> To conclude:  separating out STATX from LOOKUPX, etc. makes the protocol:
>
>  a) simpler
>  b) more flexible

This makes sense to me, thanks for the explanation.

Thanks,
Joanne
