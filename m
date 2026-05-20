Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014D2343D72
	for <fuse-devel@lists.linux.dev>; Wed, 20 May 2026 19:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779305060; cv=pass; b=VX7/pD94h4t8YqZz6C32Z9Lovq9B3bupMQybPE8r6es1Ybu65hLNKRDkoqJU/SWESsgsfqXKZzF9eKgGuMR1vM+mQBtq9GKtlWZpjVJE0QwQGLRItRSzdaBoJ80yX6ODmk4+7JjkgfOf/E3av+dwKuK08GaTRbK6sbveEW+0+DQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779305060; c=relaxed/simple;
	bh=RYQhR4/pwAjfTBfaUV6x4DC9DCiz845tJhWNEUuUUmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRljOA9VYsFUMaYL9mY1Im1C9mnb2apJy2pWphMcxQ3GJWEuoln1votKZvpzmjI5wY3U7M4IEw9T2l9FuGKPEyrrYixaGOK/PU6RiGYazE8pvnTr3MvwEJCz2UYym6Ie4e0/OQer/ZTA3OSUAdBL/ZE+zIw1Rzeg2h9iroXboVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKavo/OF; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKavo/OF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-670ab084a39so10974284a12.3
        for <fuse-devel@lists.linux.dev>; Wed, 20 May 2026 12:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779305057; cv=none;
        d=google.com; s=arc-20240605;
        b=bk5xrxUUZyWrsUXbeaR+KBwEFGTkOu3HyVssv2VugQLQUx3J4vzI5vI82Nr1bANzLe
         0x53d7d+E10+dOq5ZLPNbsNfPFD91pltNnzGopTxJIGJ9gcVVCcp5zzlOZzjPcfu/4oc
         n4NG55PzXK5chp60mn4uEkSpwlUxzgBxqd3c6enwEK11EFIXUrpgJuwzYYjPM4R2t/Me
         nRFcq9L5YEjLecMOlYCOn5ST2lRs8Olfgy5Q8jWk1rwxL/QXmr72kdlaisiRFWL4DunN
         TGotW7gY3pp44abCRm1Imny/UkmwtoNPAT1NiyVAatuRKMCNIFkEhq3/R77uAlSZpo0G
         614w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MywtOlXewxjrYMqMQj5KpULsLy3W5gueIKRBIijwzkA=;
        fh=FMVHnfSpeLyYCJiSmwvezHzWPV8pWNjoIxgGgUDMEZI=;
        b=WaSL2RFmed5I/wxMzqp3eeDcMlfD3PdHS/HeC42cc2fPppoxeCUavn6WJG8E8kMQ88
         aSF4eFWACXfe39SPVL3ghk7sM5pPuIZr7MwPBYj5f1MlZFTZkRHaPXxZWjtbob7qe2ti
         YXV1N6ef0TyXIsYvgRNpfAkZKy1rE763w8qt4d/9m5wuPw2jHBM865CLSxCo12FTXNsa
         Jj6w/uhrTyzG2JJ6rqR64Z5k0Xkkna7OdX8TwEwExxYgIpc69SKFGCzcp+oBrjI6Spab
         acCvHs3P8Pf7h/LZUjK2eWiOv0pCwClNYuNgvLqlN12vRGPT04GMVthmme9HJDIKcqh9
         TgrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779305057; x=1779909857; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MywtOlXewxjrYMqMQj5KpULsLy3W5gueIKRBIijwzkA=;
        b=kKavo/OFP001T/0Y2IMVOKrvhfWalDMPBlen+BNGnwf3lpepLF/W3B4D87LCwGlwWi
         ehNfqggestCawCio8fKJZWZp11NVQPiZydIYhe+3cx++mYByRoJ1PCV82ywgxYDHXcTr
         4I5nrDj6B1nZAcea5UtsncOPn0Hjkd8qvV5LOKdaNhnNObRodhVa9cj1QaEBiMqWNqYL
         EWcN47pRQr/457esa/22odcXcPCaGAihlQwOGgvzCE4zKUbTnwwkXZY/4P8xvtEfJ8tw
         8Lv9LaqnNlk5VZyPfHRg3CtXlC/KBlJN0it0lIH+VJrwwzSNygLXSpVl03KzQsBSQpBH
         QkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779305057; x=1779909857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MywtOlXewxjrYMqMQj5KpULsLy3W5gueIKRBIijwzkA=;
        b=bn9rjpMQwj+WVZvybQWGVRpW4n6dZtARwC3L5V6CWyMyNkqYhGQnZy5t3FegVdJT4W
         PmjLQIIae3oYYORkTQ2oXi4YnMQXlovvUKEG5k3mRynQuvHJHeTeWZMeK0bSLs/dvfOZ
         CyoYQVHuFa9ULT4cqvlBhSH/vNA+uscDfn/c0yN6FIKxAY9I+SYu5YXJzJlxhul8QeKr
         lX4Fztz5onhqvY6CWSUhOq9iQunaxZsWLflIJvtJV0Fza859ps1arrGCQcBq2yLUw0l9
         2x/w2ZdUenMbRyF1OKb9d+bCZ5sToqUPkM5NxHuxSKfa0V5mISX+Cyfh12KukLM2qYwi
         OsYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wzusd43aFFRvpiRvT75jF6IPZ+gw6z54XmPjmmnrirdNquiji6WoDG2jDoL5tCSoRPtoNG1kX/Xsp@lists.linux.dev
X-Gm-Message-State: AOJu0YzOgJeAplFeqCz0gxsLjVJ5q9C8FJn1SFEZ99FShZxf+MWXwiiw
	3VGRaNuYTm6n421EykwzOiJcOjFNMGNKj5Tw0Xmw78fGVnmNeb/oH/3CK3HES5EMBGUnbwl7AIL
	BYpW/AR4/K4fgX5GE/NX3bKiv593C1h4=
X-Gm-Gg: Acq92OFQv6Inf9s29OGdpHBp331WWeTAPw48WuNd08XN17m4P+hPlmECSHV6h3seQtM
	u5osB/wu4N4RBvl8JxcSMAxZoVpxRUi6qP65QNcD5JX6C1Phn+zzInStl4tfyIVIlYvb9lBkN5A
	hhMmVS5kHsUkcf2yY4JUoV03OyjUVXhX9KHSWkyVtx8XfkvhJb8/FDuNuT4a5CrsnByCMywdqbc
	ZBXzNhxLiqzU2J2kamQZFGuoE7ulSoku7odQCxuwhUK/XePqyzySGlQT73a2NW0ua0QuFVtIGuw
	u8q8J1MoMayNjiLqqfpivlwyjDNfwWaNk2kt5yAb7A==
X-Received: by 2002:a05:6402:450a:b0:687:325e:748d with SMTP id
 4fb4d7f45d1cf-687325e7618mr1999814a12.17.1779305057158; Wed, 20 May 2026
 12:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAJfpegvXnA1QpmfM9V+3VB470xYDNWH8FV0mBV1R1-HqvjfJ8A@mail.gmail.com>
 <20260512202336.GC9544@frogsfrogsfrogs> <CAJfpegsPqja+MzfmvCE5054y9pv1_cwPRH2uGmFws-wwxJmrZQ@mail.gmail.com>
 <20260519220359.GJ9568@frogsfrogsfrogs>
In-Reply-To: <20260519220359.GJ9568@frogsfrogsfrogs>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 20 May 2026 21:24:05 +0200
X-Gm-Features: AVHnY4Ln7lY5nmU0TWl6gzR2CNOIIBxLScEwRHXkKG8ot2v33vyDrK87LvFUFUM
Message-ID: <CAOQ4uxg7mkmE+Y+2rrYodwng1ZZZ6PycbwaBufATH4KLOcRnXw@mail.gmail.com>
Subject: Re: [post LSFMM summary] where is fuse going?
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel <fuse-devel@lists.linux.dev>, 
	linux-fsdevel@vger.kernel.org, John Groves <John@groves.net>, 
	Joanne Koong <joannelkoong@gmail.com>, Bernd Schubert <bernd@bsbernd.com>, 
	Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 12:04=E2=80=AFAM Darrick J. Wong <djwong@kernel.org=
> wrote:
>
> On Tue, May 19, 2026 at 11:01:18AM +0200, Miklos Szeredi wrote:
> > On Tue, 12 May 2026 at 22:23, Darrick J. Wong <djwong@kernel.org> wrote=
:
> >
> > > As for fuse-iomap I'm not sure how to proceed
> >
> > I will try to dedicate this week to reviewing fuse-iomap, hopefully
> > without too many distractions.
>
> Well gosh I had better get going on posting v9 then.
>
> Since 30 April I've:
>
> * Ripped out the BPF stuff after all the shouting
> * Added a simplistic iomap filesystem striping mechanism
> * Tightened some of the checking of the iomaps being given to the kernel
> * Made it so that you can remove backing devices
> * Actually check read/write access with the iomap bdevs
> * Improved inline data write handling to be less flakey
> * Amended iomap writeback so that you can run a standard ->iomap_begin
>   to collect mappings
> * Banned freeze except on iomap filesystems
>
> * Fixed some integer truncation issues
> * Add some iomap helpers to libfuse to make it easier for fuse server
>   authors
>
> > >  -- in the long run I think
> > > it would be cleaner if each file IO path (virtiofs dax, passthrough,
> > > writeback_cache, iomap, and whatever we call the original one) had it=
s
> > > own file_operations.  But that would require us to refactor the commo=
n
> > > code chunks from each file operation function into a bunch of smaller
> > > functions, which I think would sharply increase the review backlog.
> >
> > And so the plan is rather to basically start from scratch and do that
> > form the beginning in fusex code.
>
> Heh.  In reading through the fuse code to figure out how I'd get that
> done, I came to a few realizations:
>
> 1. It really *is* easier if the server can set FUSE_CAP_IOMAP and from
> then on every file on the filesystem does things the iomap way.
>
> 2. Many of the random weird callers of fuse_inode_has_iomap() outside of
> the regular file IO path are *actually* looking for "is this an
> exclusive-mode inode"?  That's pretty much all of the file attribute and
> ACL handling code.
>

When you use the term "exclusive mode" you mean the same thing as
"local" filesystem as opposed to "remote" (or clustered) filesystem that
can have attribute changes on the server and needs to implement revalidate.
Is that right?

Can we maybe stick to the "local"/"remote" terminology?
Or am I missing something subtle?

> 3. iomap and exclusive mode are mostly orthogonal concepts.  One deals
> with plumbing, the other deals with attributes.
>
>    3a: iomap without exclusive: This is a clustered filesystem client.
>    The client grabs a file layout lease from the server, and uses that
>    to populate the iomappings.  Timestamp updates are forced out after
>    each write, but otherwise it's the same attr cache and timeout that
>    regular fuse uses
>
>    3b: iomap with exclusive: This is basically fuse4fs and all the other
>    local filesystems.  The kernel knows that the fuse server isn't going
>    to change the file attrs out from underneath it, so it can cache
>    timestamp updates in the kernel and only flush them periodically.
>
> 4. Figure out how all the attribute handling works in fuse is really
> really complicated.
>
> But there are questions here -- I'd like it if the fuse server could set
> FUSE_CAP_IOMAP and all files are iomap.  All the weird userspace inode
> flags setup setup code goes away.  It'd be even nicer for 3b if you
> could declare at mount time (or FUSE_IOMAP_CONFIG time) whether you want
> exclusive mode or not, at which point all files *also* become exclusive
> files.
>
> The problem with 3a is that I don't have a client or any way to test
> that.  If I just don't allow iomap && !exclusive, how sad would anyone
> be?
>

My view is that as long as you keep the design sufficiently extensible
to support iomap && !exclusive in the future,
let those who care enough about iomap && !exclusive step forward
to code and review and test it if they care enough.

Thanks,
Amir.
