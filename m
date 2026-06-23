Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8C38B148
	for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 17:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782235769; cv=pass; b=Pde0VYj0cm96TszB1Z1pmnOotkddvwYL3qPwHXjN4ok6ypn+Oi5EW12SpKwPl+f2vGq3lg4+CRW7BAlAVrIVoDTO25uIY0z/VS6StZy1a7JnUuoG/J2CgYa7F/jo1r5/2oY4B9sfpAd7KWnnLotshPRFWh9UDfMz566A0zI/f6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782235769; c=relaxed/simple;
	bh=R/Fe5SnmFz4pInrDHbvj1u/lF1jaDqBAJE2REUZG8sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYcYvQxZRr2rNBx8GIoQctEdrxov4L8SX3DruuxO2dJuP9ptBiCAU3KXnJ6Z5BKsTyjrCYyCo3GnyHIs+ifGjo45gPswrnuP3yJtxfFzOk6YSdli2XDqca86QNbgUopuhvTfduzdGxHewnQMyewlY0weQI8yVTKie1MAkRkn9KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fe01lznv; arc=pass smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fe01lznv"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-43d3454f643so115378fac.0
        for <fuse-devel@lists.linux.dev>; Tue, 23 Jun 2026 10:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782235766; cv=none;
        d=google.com; s=arc-20240605;
        b=ThHmAoziA5WVHGA4V2lOx3yHOlhzc2W3TwsLKSjqULJ7EbIVEqHLPBfNBWoAsWc6g0
         XWsOqroZ3np8SwYP9eBbzGrNa0H5OglZxOV90ktwNbzwi9HXMXyfpQq1zamgzpv31G4G
         49gvr1y8eXPYgUP4LW9n6zrmJgamralpk7Td9+7KTTNf+BGk/1A500t0d9/V1nCO/c3F
         P0RyhuasM7wALefJGvCRiLGlbjfi00LWvMckKTjzacfJI47zUJraISEdIlOavuWmBkoI
         4omTbi1+MxchStxVIcRP2mrDiWbQmHYzaMbRID4TEo++FmnQ4e5RG17bueIrho3aJXao
         qCTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOKLBFVXea5OkC+RzUd8udE2QmUOJ4Ga+YnSpSPdn2Y=;
        fh=jMmWhWzVbfs3S+fRE/W/KW7Bb4JyMCN4KydabNzkPYE=;
        b=HHqz6MXwuQMfBqSBucX9GSXPSQtVs0sidaGTohgV8mR0ZXaFM1N+dlsqZlKzdZqvPf
         zWwZi2xrRMeJIs/3E6foHxdvdCZvAU/iTEJXW8yQ79dmtUDl2182DJeXsFvlK98n2mWe
         EJSmkhNYDRPWUfbxmatzoxlVDZv78oLXQpVocwMdzYtL/srnT5QM6stXd8dyZ/rfoJ4H
         ubW8BX8CnlLJADFCi5tCy6lDjTwRfqGzf4PJcqpChBnnupXw+QSlHewuQ0bI76g0LC4/
         Ch7tqOU9UPSGIOoKvIebObzlUlHk2Q5MMgSdu9YhEnpZGvfC4LZrWe1GiHVE5o+ihZ5J
         HgDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782235766; x=1782840566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOKLBFVXea5OkC+RzUd8udE2QmUOJ4Ga+YnSpSPdn2Y=;
        b=fe01lznvKKfXYOBLtXDfh6668STTHOkCfW5JygRnyavuFnHekUSwb+qQPpFE7vVtat
         aBzfw8Q9vIKSLEocw84yG6P144WETwjCLEagl4sr5dc/xBAAccA+TMAjiOgw1/gsmkgp
         mnlxtFSZ6iyxMZhj+yLa0EM8Xlb4bQxTmoK5jRaM58TOV85zjEc5SEgllqquW7W9QNlI
         7RcsFylDe0VcmIuYbYEJ+ewsIOvnGldTMVqf13C0H/2PTym86aTvCu/SfaL9rm+qXLfI
         lhF9VVJED+nUQB1r8fuSWT06EFucH6+EmpttuC70KuI1jqftZw1sNTOhv8V1rliiXSOs
         bFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235766; x=1782840566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SOKLBFVXea5OkC+RzUd8udE2QmUOJ4Ga+YnSpSPdn2Y=;
        b=pAI0lCoPt8fy276vXC/VS1CmAIw0D0y63X3dLRYLz1UP7gqn6YrjLAdX0f8X+AIh4C
         QCYUTOadMpR3BgonS2oxBXzvdILkwmhD0JgMtTMWf+sAjHe9NdRXwRry+lJkt22UcUwg
         xPdf/+l6lMc1Gs0zoSL6s8owi00Jau9qVqwRGtt1etxGlWJHp65h+0SzlXE4FhD7xUFL
         0rSAb2u17so52+niZTvfkudB+AUUd0fwowJskhbYil4Qo45Cb7uGe4xJukUxdjyPYJLl
         beD9noruOqKVRCekBL4Y40r/OgCavK/5OpXwTN2yEETAXH9BLz9gu+5ovgJ1vjYg3J7m
         3KTg==
X-Forwarded-Encrypted: i=1; AHgh+RrssJIOSwp9hAz1+CUeWpNSiDLGd6d6+0T4JZkClJ4JhKeEJBnftWsYs8PPeRvwgUneE6GjMNCB0ZmU@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4ttwsc9gj9AfAPAzykBXP/FTKuB8oWmKgayay/+puWk4f0eWE
	kQm0YH5ZC59+4gz3/DXBfUJrrdbWGgTFt3Th+//XjdyEGVi+2FGo8EC/4A9uUCEf999xS5uL4LQ
	sakxAaT6SyywpQMn8KcDH2uYm8D+/hnE=
X-Gm-Gg: AfdE7cmcH9OC590y2wMO64PA/rhDkWnF5F36QHo7cgu5YdX7LzeRaIye/oSFIYxQBEa
	B96CsxVmbkI2YRU3YiP9pdz/VeDGzPsucmxW2/wyYjbkM3yL1jTGaKSJ3RGUlWCmf9gk1JepQ4j
	wwBe7aBHTHNuAaeQcA+d6o1f0pnQ3B2lOvetc4FPaQ2DmtF2aj+pYpArLx43eR1/r2lyEwAXuQ0
	1KpLJTBzIqQafRegC/sxAln/GMoy/UnvYKP1QtVldIXlH7mz0pveHOcKPHB73JGDB4AZCo=
X-Received: by 2002:a05:6870:c22e:b0:430:29c3:9d15 with SMTP id
 586e51a60fabf-447b653ffaamr2576825fac.1.1782235765975; Tue, 23 Jun 2026
 10:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANaxB-xVCP5HSUNwphFrKPdW0Qh1pA33A6npac60WArkZMFt7w@mail.gmail.com>
 <20260623094211.1080873-1-safinaskar@gmail.com>
In-Reply-To: <20260623094211.1080873-1-safinaskar@gmail.com>
From: Andrei Vagin <avagin@gmail.com>
Date: Tue, 23 Jun 2026 10:29:13 -0700
X-Gm-Features: AVVi8CdxhzkHtkOXOPWSv5LcqN-nC_Tc8xPzc65F7h69_IRaRTA8RjzQbS4VMPM
Message-ID: <CANaxB-wcNOSs9vHpZ_wG7Q8WJVV0D2nhtCFGyZ1_5Rg=+256cw@mail.gmail.com>
Subject: Re: [PATCH 0/3] vmsplice: make vmsplice a trivial wrapper for preadv2/pwritev2
To: Askar Safin <safinaskar@gmail.com>
Cc: akpm@linux-foundation.org, alexander@mihalicyn.com, axboe@kernel.dk, 
	bernd@bsbernd.com, brauner@kernel.org, criu@lists.linux.dev, david@kernel.org, 
	dhowells@redhat.com, fuse-devel@lists.linux.dev, hch@infradead.org, 
	jack@suse.cz, joannelkoong@gmail.com, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, miklos@szeredi.hu, netdev@vger.kernel.org, 
	patches@lists.linux.dev, pfalcato@suse.de, rostedt@goodmis.org, 
	torvalds@linux-foundation.org, val@packett.cool, viro@zeniv.linux.org.uk, 
	willy@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 2:42=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Andrei Vagin <avagin@gmail.com>:
> > Actually, this change introduces a performance and functional
> > regression for CRIU.
> >
> > Here is a brief overview of how CRIU currently dumps memory pages:
> >
> > CRIU injects a parasite code blob into the target process's address
> > space. The parasite invokes vmsplice() with the SPLICE_F_GIFT flag to
> > pin physical pages directly inside a pipe without copying them. The mai=
n
> > CRIU process then takes over from outside the target context, calling
> > splice() on the other end of the pipe to stream the data directly into
> > checkpoint image files or a remote network socket.
> >
> > I ran a simple test that creates an anonymous mapping and touches every
> > page within it:
> > Without this patch, CRIU takes 9 seconds to dump the test process.
> > With this patch, It takes 18 seconds...
> >
> > Plus, it obviously introduces some memory overhead.
> >
> > If these changes are merged, we will need to completely rework the
> > memory dumping mechanism in CRIU. Using vmsplice() in this proposed for=
m
> > no longer makes any sense for our architecture...
>
> I just have read some docs for CRIU. I found this statement:
>
> > #### Why `splice` is Better:
> > *   **Consistency via COW**: The `SPLICE_F_GIFT` flag ensures that if t=
he process modifies a "gifted" page after resuming, the kernel performs a *=
*Copy-on-Write (COW)**. The pipe buffer > continues to hold the *original* =
version of the page as it existed at the moment of the `vmsplice()` call, e=
nsuring a perfectly consistent snapshot of that page.
>
> This is wrong (with released kernels). I confirmed this by testing this o=
n my current kernel (6.12.90).
>
> See the code in the end of this message.
>
> If you actually rely on mentioned consistency, then, it seems, CRIU is br=
oken.
>
> So, in fact, my patch actually brings consistency to CRIU. :)

Askar, unfortunately, the statement about "Consistency via COW" is just
"AI imagination". The under-the-hood docs were recently transferred from
the criu.org wiki using some AI transformations, which introduced this
wrong statement. The original document can be found here:
https://criu.org/Memory_dumping_and_restoring.

To clarify, CRIU does not rely on page consistency for intermediate
pre-dumps. The pre-dump mechanism is designed to be iterative: During a
pre-dump, tasks are briefly frozen to vmsplice dirty pages into pipes.
Then the tasks are resumed, and CRIU drains the pipes. If the process
modifies a page after it has been spliced, the data in the pipe may
become inconsistent. However, any such modification is tracked by the
soft-dirty page tracker. In the next pre-dump iteration (or the final
dump), these modified pages will be identified as dirty again and
re-dumped. During restore, the images are applied sequentially, and the
final dump (taken while the process is fully frozen) ensures we
reconstruct a consistent final state.

But what really matters in this scheme is the vmsplice performance.
The proposed change significantly slows it down. In the case of CRIU,
vmsplice performance is critical because the target process is frozen
during these calls. Minimizing the freeze time is the primary goal of
pre-dumping to make migration almost invisible to the user workload.

Thanks,
Andrei
