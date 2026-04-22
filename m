Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4A4221F2F
	for <fuse-devel@lists.linux.dev>; Wed, 22 Apr 2026 06:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776837737; cv=pass; b=PlNvCo5m+X+TZsVchUEJ/g9qsB5lVY3tL/DH+g14L+rmZn1o9MiC+pWlAwTRuWQktipjg4aF2GJys3th7NEkPqFTLMN1Q+AvE19LT5vLMnXW3ez+brZ8a+jdUK7A+OQn9KF+PT6xWlQBYAzeewOUWQbOjXRHqAA+TEaACNpkAwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776837737; c=relaxed/simple;
	bh=BjC5nZokVSzQfJUJ2yqWU3kXIFX9Mxyqw/JhldWd4qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7e8sDwzR73KcLaxTEoUx9lqFwLO5EXBPepK0Q3cjGyNQd1ZOYFMYZf9MecPzZf8y9ollxbXGx4QhL81SeAKN8zMVR9so/k/t/Z7L2bosIHf8RPXSuDI6UBpckiW5bOAqOflHhb+UpxitKlOq41HIwWsDVdYL3WtlBoXLcFDqRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qb4rFgk2; arc=pass smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qb4rFgk2"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b941762394aso683462966b.1
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 23:02:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776837734; cv=none;
        d=google.com; s=arc-20240605;
        b=CQ37M/qryKrkBMff925iaSCJQQvIagWTbs0Kx5BGf6noDRqfiEgXsX75zgHeW/oSuW
         XVj0zRQioenYcLynQ1S5rcyb2E1/2E3NTk0zl9glkjvpWihzJ33dorpE381Tdw4LVZto
         aFfW5hGo9uAJORdrwqA8dvWpDuVy4wquZfo8Obzn/hKlYvO3ST8ZdzcryR5vkgaAlac6
         PViORgtgh60g7n+agCGobQcuzLugGYcVJwf1cDhUH3gZXhbY9Xm//K9H/6lcTW8wmfaT
         y35kMs6gKW8Ew89xjcFuUZI8kqgbZeTnm3CyphfwhrJ81COs9lkQxD8ttRx39JlSab66
         DoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BjC5nZokVSzQfJUJ2yqWU3kXIFX9Mxyqw/JhldWd4qc=;
        fh=CzuA0Q4g8vRPR22hTnzVwyQkFx3BP09UWrWdR2ghuO4=;
        b=UdoECuspiEdyO79mBwbmCXi4IRIXMHLm6+pzPiYm2dVrAsKhd+dlhJ516iamU05+Mf
         vXfRxngUd5rsIU4Z4C988IADL7BaTfMiPTkzK/nijVBIFfogUrgMbqve24J0r61G2gLH
         pRzLBhciBCOnpfPd4T+ZoC3SjyxY2Hn7Ifk9De174iYYYg6rMcM0cws2y3gGc6/5CBFv
         so8PAI6spY2TnujeKuAQ3epLC+SyZ+boeM2f6QzxzqZognzKUJFO9K/Cv1eln5TKWZuT
         SjtTSu8PHuhhSzKiMCsjPxyTicj5ACOoPKXQiPSHVOUeCk9kQO4uiVDQYvJypEM2SSp8
         dDig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776837734; x=1777442534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BjC5nZokVSzQfJUJ2yqWU3kXIFX9Mxyqw/JhldWd4qc=;
        b=qb4rFgk2vvqK2bj7fY6FsN4QFa8wHR80aqCDzaJhN+hBzNvUdgoeBCf6oLmAXqq7X0
         YIIeGrNFU0cLdEaja53hYEv3/gUZnE5TFMFl5yLfo43Djo1ItHDN5ZmkJK8QvAhnIrfC
         VoZtbaaxlJ8vsIgf/fNCxIcgMF+6wmoW+5O7GwrJnH+rR0692cdcm22fphep6DtPLOwM
         zqP7d6BtnikrvUJaPdknKUP/eguxz1xtg8wJd/GZRvpOj3BSQ08UzTPhSBSwnk/C8Mfi
         lwnrG15alnQKpTxjXvj4r637CH2q5gEqsoZmYFuY8F4V6CclmriqnLbudQMDFvDjMgIt
         7hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776837734; x=1777442534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BjC5nZokVSzQfJUJ2yqWU3kXIFX9Mxyqw/JhldWd4qc=;
        b=cQXRrInOmIJ3myKAUuTdrjWRJUa5FUF8cTV9Ndi27wqOW6xabTX7T3KrCXDlyLDSJD
         1y1BqsMmDgYgYVS2B07lFuzrLis7Jw1EBTk3l44YgSm1ej5xF4DifbKgsJT0IfRmcP1Q
         KS7z9/WFtCT9DD2E+ac5jkWg+tsrIU1g208Cog33jBnhOcdVSNDzBM4ENIoPoJsYGOJ7
         wx0Wj3gtn89t7Vc4X2bJtmUojZAiRMlVX/e+d49YjOryS9smMpQBMxNKl3fp6vT/4r13
         hdAvbw/zjYRSf/WkraDi2d+t3pleAMEpHPFMpc/+ojUhAtp/2RbVYJzxPDs2VSE0BMv6
         DbSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YdHwOlDvTiozUWFSbTGIM2z+9yfT2uim9PCnKVlIY26fHqcO4T9VtyXbDvcKLa5ih2mPQUNFyIuir@lists.linux.dev
X-Gm-Message-State: AOJu0YxBK4jLOfnEMWbS4pBuIUBcMU4ylP6TNdjYX8ak+RyNXThfcP/3
	5y0glHG+as+CphqhDfxW4yuxU5jNJulzFtfTxdF1ABy+n2RS/dSJ+w9qL3H5JQ4/a/GwPDUwS3V
	BLqhIHffKLBq3pF53J3rMknb4PbshGeI=
X-Gm-Gg: AeBDieuhYU4AaokKQCpbcnj9jPnJ6akeieGdTtRHqfrD1zCatzwCY2E85sVpP+ly/+p
	+k4T6DyeIDdWKzPDChkZ4Zlydz8tiFPAmdIC841j0FTEvMOvhi21JMAmcpvICTQrJaqzy2BXg/d
	cyiRLiUgRlvm/+PaELuR7Wpbm8hPuQEGNXDenA3GCfxd4r/5wQxavisv3vQd90ffiT4MLMwVUn2
	hhXL0y833IkKwWxShH/8YjNsx2GBxlN5Mz4qUqENWpRS7SDXRg3Tak4b+O1Xy3a/Zr9/zku63d4
	p9ySlduvxEY3XFIx3xdMxsH/MSI6v4xCh100NQH9o9JlLo6TMUm+
X-Received: by 2002:a17:907:9619:b0:ba7:a1cb:eae4 with SMTP id
 a640c23a62f3a-ba7a1cc03d9mr586110666b.23.1776837733287; Tue, 21 Apr 2026
 23:02:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <CAOQ4uxhbR8AoBCUMYQntAHzo_1wjh=Qcpb1z0CE4ynfDE-ZAFQ@mail.gmail.com>
 <CAOQ4uxhVnzoka4QppUvmFmq3wtXSU_ahgpkNR==Gbnpm5hpUyw@mail.gmail.com> <CAJnrk1YJ9YDTrERtNiXZ=vAHr7kKRzS7iUphQemVVXf63yt7qQ@mail.gmail.com>
In-Reply-To: <CAJnrk1YJ9YDTrERtNiXZ=vAHr7kKRzS7iUphQemVVXf63yt7qQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 22 Apr 2026 08:02:00 +0200
X-Gm-Features: AQROBzDlvJL5YH0RdWENtW_ekbxbXuw5mB5CY8i_2AKTM_v9xbZEUZ3Tbstf6wg
Message-ID: <CAOQ4uxjBZL6CY0mJEiHrw8aR28MHg5pU+Pfr9fUqGdKPDOdwcw@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] fuse: extend passthrough to inode operations
To: Joanne Koong <joannelkoong@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 11:05=E2=80=AFPM Joanne Koong <joannelkoong@gmail.c=
om> wrote:
>
> On Tue, Apr 21, 2026 at 6:55=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, Apr 21, 2026 at 11:37=E2=80=AFAM Amir Goldstein <amir73il@gmail=
.com> wrote:
> > >
> > > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@g=
mail.com> wrote:
> > > >
> > > > This series extends fuse passthrough to support inode operations (g=
etattr,
> > > > setattr), directory readdir, and kernel-initiated open on backing f=
iles.
> > > >
> > > > The existing FUSE_PASSTHROUGH mode attaches a backing file to a fus=
e inode
> > > > only when a passthrough file is open. This series introduces
> > > > FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode nu=
mber
> > > > mapping, which allows attaching a backing file for the lifetime of =
the fuse
> > > > inode.
> > > >
> > > > Future work includes passthrough for additional operations (rename,=
 unlink,
> > > > readdirplus) and full subtree passthrough, which will be part of a =
separate
> > > > series.
> >
>
> Thanks for taking the time to look at this, Amir!
>
> > Joanne,
> >
> > Thanks a lot for picking up my abandoned wip!
> >
> > Could you add a few words about the intended use case in Meta?
>
> The main intended use case at Meta is to use passthrough to reduce
> startup latency for short=E2=80=91lived services and batch jobs that need=
 to
> fetch large packaged artifacts over the network. The idea is to add a
> fuse-based lazy materialization layer that supports on-demand fetching
> for cold data but that once the required content has been fetched
> locally, can switch to passthrough for near-native performance with
> minimal userspace overhead.
>

Yes, I figured.
I wonder if Meta plans to completely phase out the fanotify
pre-content events based solution.
I myself am putting money on both horses so not advocating
for one or the other, just curious.

> >
> > Is the target fuse filesystem expected to be used by arbitrary users/ap=
ps
> > or by a controlled set of users/apps where a posix_fadvise() may make
> > sense to configure readdir vs. readdirplus?
>
> I think it'll mostly be used by different containerized/batch
> workloads and services, so for Meta's use case, I don't think it can
> assume users/apps can be modified to use posix_fadvise().
>
> >
> > What is the minimal set of passthrough ops that would make this useful
> > to your internal customers? Is readdirplus in this set?
>
> The minimal set of useful passthrough ops would be open + read
> passthrough, getattr/statx passthrough, and readdirplus. The internal

Do you not see any getxattr in this readonly workload?
Are posix acl checks not in play?
passthrough of getxattr/listxattr is quite low hanging IIRC.
I actually had it in the wip branch at some point.
Unfortunately, I don't remember what was the reason I removed it.

FWIW, for my internal customers passthrough of
readdir,getattr,getxattr and access() is used to speed up
file browsing workloads (especially for huge directories).

readdirplus is of course desired for this workload.

Passthrough of open, I am not sure why this is so important?
As fast as passthrough read/write is I expect it would amortize the
cost of OPEN calls to the server, unless the workload is open
of many small files??

> use case is read-only. readdirplus would be useful because the
> workloads often do directory walking followed by metadata lookups for
> the entries
>
> >
> > Do you have profiling numbers to indicate which ops generate the most
> > overhead for would-be passthrough ops routed to the server for the
> > target workloads?
> > And how do these numbers improve when using io_uring channel?
>
> I do not, but if you recommend getting them, I can run some benchmarks.
>

Up to you.
My intuition says that passthrough ops are a big win anyway,
but I never checked to what extent uring ops are to closing this gap.

> >
> > Regarding "full subtree passthrough", what does that mean?
> > That lookup op itself is passthrough?
>
> Yes I was thinking this would be something where once a directory is
> marked as full passthrough, the fuse server never sees any requests
> for paths within that subtree and everything is fully passed through
> to the backing directory.
>

Do your internal customers have this use case?
A subtree which is known to be fully materialized?
I wouldn't advise trying to implement such a complex feature
without at least one real customer to justify a real world use case
where this feature would actually be helpful.

Is the cost of reducing a single server call per cold cache directory
really worth the extra complexity?

I could understand "passthrough all immediate non-dir children"
may be useful and not add so much complexity but again
better base this on some real world use case.

> >
> > In that case, would there be no way to escape (opt-out of) passthrough
> > inside the subtree?
>
> Yes I was thinking this would only be used when all files in a
> directory map 1:1 to a backing filesystem.
>

I remember at the time that Android FUSE passthrough/BPF patches
were discussed, that the 1:1 config was mentioned as a good way
to test passthrough ops, but this could be a simple per fc config
which does not raise all the hard questions about subtrees and
renames.

> >
> > The semantics sound challenging especially when considering
> > moves of directories in and out of subtrees.
>
> I was thinking cross-boundary moves would just return -EXDEV, but
> there are probably other semantics I am glossing over here.
>

What is the "boundary"? Who checks this? kernel or server?
Those are questions best avoided unless we have a good enough
justifications to answer them.

> >
> > Anyway, no wrong answers here, just trying to understand the
> > first mile store you are aiming at and the expected improvement.
>
> The first goal I have in mind is eliminating the getattr and open
> round trips. I was envisioning the passthrough work to be a
> multi-series effort where
> everything would get merged together at once only when all the pieces
> were ready.

Everything being the read-only ops? or everything everything?
The main reason I introduced the ops mask was so that we
can chew this huge effort in small bites over many kernel releases
and slowly gain confidence and field experience with the practical
aspects of fuse passthrough - and this includes the api questions
and which opt-out combinations are important and which are not.

I suggest that we try to focus on shipping a useful feature to
users that are going to use it - that is - your internal customers,
my internal customers and whoever else chimes in to test and
provide feedback.

All the rest of the plans of subtree passthrough and directory
modify ops should not block the first useful feature release.

Thanks,
Amir.
