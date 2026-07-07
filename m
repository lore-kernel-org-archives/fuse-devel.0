Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2843F4AC
	for <fuse-devel@lists.linux.dev>; Tue,  7 Jul 2026 18:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783449013; cv=pass; b=fngMfXWIfDcU2k7IPwhsYHipf7HquxGOv4rkeeWZ6uKEYu7Tb92rlF0Hnmtn96pf0YJu7TxMRn9fuYH53i4Lb87v0EGcAoY63gaI3hC6z8NDAxtMiuCTB2KLT/ROpIPl3XzKKNnfU4o0fZKZt1FIG8ldH+k7cvZSKJ4WK7Gnd7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783449013; c=relaxed/simple;
	bh=IV4YvDnORgucohflDz2P9wKiqO3GLGxNd9nPS0YBa2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ABYOdI1Fd2VgE0NZQsVtv0hIaX744qnIIFvNgU/I19lcbXDVXp2+CApo6kEoxY5arGrP0C31Q4GtnHT7ceJgb7qt61uKW4kNm0xU7jwn4cdo1Tb0hd5WxlPmlwRLqiWbirZwib7Ds6K9jHJiK9JCMa8XxtnTA1FLC01BrqiDIo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=rNaFBQtk; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="rNaFBQtk"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso3027156a12.1
        for <fuse-devel@lists.linux.dev>; Tue, 07 Jul 2026 11:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783449011; cv=none;
        d=google.com; s=arc-20260327;
        b=FEtdZdhuLQX7GR9KgDrzquOuN/Eoqqj2Tgto1YRI17pNJwtXUZkDZFccL5HmLt1tz+
         3NSHV66EbJ7ljLAicA8LnkSpHGYdqDk1EzSvRRytf+PRcGlmVsW9NZ970O/DraDLNluQ
         52SHL2FJTwhOXHbFTSvzZM0BNUDvE6oPW5fdTBiLA6f3/cML/QkCZ5Ljtq9aLrRwOTZ4
         u625u+G0ZMxx1qsRxQdQvEG5qjVSTxCuq3TTniugHruY5DeqkwU9d8eZ0agGePecE9Su
         iAtfcytcvdADSyZgACKga1BlOiZ1XxFvrkjVxhNECqWumniWH1R60uoNVwFpP5ihftPy
         uDXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bLe42YRHnqPt+HLWXCR0C8s0diu19eHjE2bEKTQVrVM=;
        fh=+t7pfGrJWr0FUyTDhMW9oqfNVcJaXXIMteKQhGqXvDk=;
        b=DYlf0ie9xufPKsNMHGI4UXEezNGk1Sld9Bsuo9Sdy2wnc9MJPPSJuhp+r52yWTgfSt
         c0uxvRoO1My79S4iiFcgcwzPRd8l9WsZlGRNiQ0KN/DWYfgUvGYSDiHsUn/9QDX2KPiT
         lbPeeByppHiOzX7AZl07+KsnnxVO6ddEjaAc/n2tS+Vo1c5CdAga+Rk2M8RUzchkVPud
         Jz3dHmkyckPDXe4+VCckwWmIne6A4rQeC8cmSasukg7AyCJut3l/qXPWnMTPwgzT56lZ
         PkbACaSVdbpPYlmSEVoEQUvCeHhjsQ2A3zOdQWAbHV9vEbmpPDbFA+XapDYjsCPaMXbU
         KCAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1783449011; x=1784053811; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bLe42YRHnqPt+HLWXCR0C8s0diu19eHjE2bEKTQVrVM=;
        b=rNaFBQtkOUcv1LuEC2DRXuG5sb98ZLgWD88NPkzA3pzdSv40cOVVp5xEgmu0r7J0d3
         SpOipxsEq/cqsI1ZanrRPR7fqDAYOCuLe//JsHgsMWyZjFu0vA31uYDkJImWiBAr16g6
         5lpvga0OMZuqG0JQLqUAbkadUfT2dzgt/BeKsJ//J3Yo4uxMSGcPLDMNfRvrc+5fZRR2
         IpUu30QWR+GucNY9mhfPGhSBpDK6dR6HEwgq8hpMaaxjhilQ57w1CV6hqw9UOpOTXt40
         zUXTjHsCEqrLzbi3ivKt94Bwum3gPhF2qYqfld9mu/DtVCdZvfF8b5lxuSJdpk5o4BK1
         RZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783449011; x=1784053811;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLe42YRHnqPt+HLWXCR0C8s0diu19eHjE2bEKTQVrVM=;
        b=o+nVnHkYLFKm7wN5sRVgLH2zvwkYqLs5xKUX/PKuH4KjPzTQcaFy3SKN5lxszG1xSJ
         ayTenghrcEWSWOQiK9AZqVKXAsRNnPN8ZAqfX2Rhn7p82gSt10LjdpOVRXu9w0y51lkR
         MjyY0W+s8oIZI9ztMPhGrQeSRpZZVuJJwOuHbhQ1tacGvgyymmJg+4KL0bWTZp5ss5tG
         84k0fmCubFNQEFMWldzgTqBSwXOQ2efmteDYXPki9ZFn19kewSyPgV0KajkdqrdppPu7
         wY/J6fq07W1mN8IA87T4J8ACHzdxHngAVnSQkuBZY0xzxQ+R69E4wdr6eJVY7igdzucb
         VHaw==
X-Forwarded-Encrypted: i=1; AHgh+Rop6sVO+6NSvkpQx+GTFAQM18bvvfk9g3F+meKx9xDBzQWyLypTOarT9ajWUs81VSBifmc+0kzvG1Ty@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Sa6KdYcRlNpPgq8Nx6hsWXUn6XfFOpuZF924CsEEVxkVulFl
	VVrhLJsjGpheQRFiPILzHy2ySvD55hr1anCCPwn9+8FuBC3r+sGrUuj45VBHiji5ezTYMEQ7YlG
	8gXITSJRDWE/IT42YUQie13xJYguVZOLqENDfl7kH
X-Gm-Gg: AfdE7cnnZ6YNV/XXxZrPK/z4sfJg7wORNYVr49h/+yFKHo6C7c9wRC+G32EHkIVtyz5
	7n6WknkeCDdi1gvICcixAORfASkJE1aCrYOrMb4e7gji9gyrSDdQv18fYLCkcKswSbW4LdSW6Yy
	2LcK66+ab5pwEuG2hFwFvlJunoI4L+9GNuaIdYSFNtClcH5i5L2ft6LBDbh4eAADR2dnAWn0zZ5
	Q0EXZ7YLGtliGL4OI/OhsH8RHUqdMCyIo3jI73fGk5ydQ+ejgut/+BOX8yzjrAvlJ66mqnN8Jvt
	SIFjFrXmIOgE540eyinT46zUrecD
X-Received: by 2002:a05:6a20:9188:b0:3bf:96c6:78a9 with SMTP id
 adf61e73a8af0-3c08ed40638mr6618578637.2.1783449011139; Tue, 07 Jul 2026
 11:30:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706191309.2887515-1-xmei5@asu.edu> <CAJnrk1Z-6ezCKAEicOEoFVJfhg6Es6R+E=iH4HepmwrpBiETdw@mail.gmail.com>
 <20260707054031.GF9381@frogsfrogsfrogs>
In-Reply-To: <20260707054031.GF9381@frogsfrogsfrogs>
From: Xiang Mei <xmei5@asu.edu>
Date: Tue, 7 Jul 2026 11:29:59 -0700
X-Gm-Features: AVVi8Cce3G8c1iDY0MJ78zs7gij-Nt-NXYatlMimVr57IRJUm9QAYer-o6WM9oY
Message-ID: <CAPpSM+T4D+Ym=JwA-zqx5RvRzktN2--WJnOrt=3xcuTRoyW09A@mail.gmail.com>
Subject: Re: [PATCH 1/2] fuse: copy request headers via a stack buffer for io-uring
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
	Luis Henriques <luis@igalia.com>, Weiming Shi <bestswngs@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:40=E2=80=AFPM Darrick J. Wong <djwong@kernel.org>=
 wrote:
>
> On Mon, Jul 06, 2026 at 02:17:12PM -0700, Joanne Koong wrote:
> > On Mon, Jul 6, 2026 at 12:13=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote=
:
> > >
> > > The fuse-io-uring transport copies req->in.h out to the ring in
> > > fuse_uring_copy_to_ring() and req->out.h back in fuse_uring_commit().
> > > Both headers live inside the fuse_request slab object, whose cache
> > > (fuse_req_cachep) is created without a usercopy whitelist, so copying
> > > them directly to/from userspace trips CONFIG_HARDENED_USERCOPY and
> > > panics:
> > >
> > >   usercopy: Kernel memory exposure attempt detected from SLUB object
> > >   'fuse_request' (offset 56, size 40)!
> > >   kernel BUG at mm/usercopy.c:102!
> > >   RIP: 0010:usercopy_abort+0x6c/0x80
> > >   Call Trace:
> > >    __check_heap_object
> > >    __check_object_size
> > >    copy_header_to_ring          fs/fuse/dev_uring.c:618
> > >    fuse_uring_prepare_send
> > >    fuse_uring_send_in_task
> > >    ...
> > >    __do_sys_io_uring_enter
> > >    entry_SYSCALL_64_after_hwframe
> > >
> > > Bounce both headers through an on-stack copy so the usercopy touches
> > > stack memory, not the slab object.
> > >
> > > Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support=
")
> > > Reported-by: Weiming Shi <bestswngs@gmail.com>
> > > Assisted-by: Claude:claude-opus-4-8
> > > Signed-off-by: Xiang Mei <xmei5@asu.edu>
> >
> > Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
> >
> > I think the cc stable@vger.kernel.org tag is missing here. I added
> > stable@ to the cc list on this email, but I'm not sure if they require
> > the tag being explicitly in the commit message to get it backported.
>
> I used to like it for XFS once upon a time when we did manual reviews
> and QA of LTS branches, because it was a headsup for something that I
> should actually watch to make sure it actually showed up in stable-rc.
>
> --D

Hi Joanne, Darrick,

Thanks for the review!

From what I've observed, the "Fixes:" tag alone is often enough to get
a patch backported, though I'm not certain that's guaranteed.  Adding
the explicit "Cc: stable@vger.kernel.org" tag makes it reliable either
way; feel free to let me know if we need a v2.

Xiang
