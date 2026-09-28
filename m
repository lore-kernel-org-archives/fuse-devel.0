Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A13546F9
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790627425; cv=pass; b=O7ZF0bTfQdstJ1Eax5LE/B6VDTKSM3HNJAi9zalyqvyTlXiqp6ZivQp1x09gle08i6nl7xI6QKG/isD5K1anNTHm8ZVaL/2FlpKFqtxk9yJuSFIv/FSslXimy2isSOktatVF1z/TPUAjYATVHtq2bCyxRRkbGT42h0nK3OFIc3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790627425; c=relaxed/simple;
	bh=ETQ1IROJ2AuDJmeUFJNBEq75XtvGR4u4RMC6LRpJ1y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgt1IdClbe0FF1oMXwSlCzGKSIbf9q9T1B5YPWtoOUyKyxQbiqSdPhGZfFtjFL++HC7bP89xsfwIHi1+ikFxjkNLfMow5Yq+vGH2yZg0MYZXeiibKrV0qcuNKckO5I5Thw3Lwzo6NITNaenzZMA5jNRIYkltuRiaG7dw8Xdis6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxwPCLdG; arc=pass smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxwPCLdG"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ab062a08f5so3448646a12.2
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 13:30:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790627421; cv=none;
        d=google.com; s=arc-20260327;
        b=s+URcSR+f3daQsrd2TlQCSY+eb3kBovbCtHBfsIBCrEyB74AGGnhLyWrVAdLMp4Efa
         lMElCHSd3IyjhB/p6s9Rv4d1Ww/6M73EsBHcLVC39jMzsx2egnwrFjphXiloEbgeQyMb
         buKJUs8XJ81d3H1HywMfvbqrC5suEBhBgUoKaBoPaReBw4tdNmrP8aTjEQy5fkMf8qmD
         C8S5b8zNb0dzGFq7Rb4BpLPvK+/UPA92YteWfDNRBBDUJIcy39wsP6kVmT26sbmQiiEu
         vVHpTYA97kZemub5h9uMrpe5NNjkIfpNDgFQ0jSrH5vIo5s4TPPDE07gPhbjjN9EQEzi
         H7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sQTC6j5DLlv+U5D0JiGxRJATLsn/7sTeYAzE/ml8ntk=;
        fh=LPGjmZBKLijBaiJSKy3uKiK83Z/FfMPa65GkzjLZYAM=;
        b=Tq6O6/SMNnBLTDlUIKrjEwJxkIva4sibosL+3GNaXS6K1guvC8IV7pWZbRRzl2GlB+
         p9plOGMFcyWFbYa6bmumuq5DVh06Y1T6CwJah+Nmfkj66Lk2assxewr/zlUGqgmAjNmS
         YqGhGt95oK3VG6qpVVNjK+YqelpH84p5tmVNy+jUphRvvOZsMfLfEIdT/Xynp7NPnbAF
         66IN5vsiYJF5IxpIQpG3L0visWtkruFdcd+jYYdbQb9XBVhfq0JKnDUzbpRpFI3/pPpN
         H6sGZ5YDM7PSBhYJKiDnzIuhDsE5P1obRCywmX1gzghM/To7NFwlC2UDmX05qdb1Se3U
         KEMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790627421; x=1791232221; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQTC6j5DLlv+U5D0JiGxRJATLsn/7sTeYAzE/ml8ntk=;
        b=mxwPCLdGwvz0HAvSPefD85KO27MZHZRADunjURMJTnUVVTXPyvyhVzDXzvkbx4tkV+
         8jq+z4HyTAKTL9A95xBakIe4MzLiHhjD2HkHj0ExxY3PUzESMBjwQIkc5eGGhurYkaR5
         5sYynoofBs1ZKDWD+/xEvVEvXr3N+nA424HnG6PUf1JPC10hPF2qUu0ehNBIFKyHKBDP
         ywLodYT9xfSHKOesJWlGxIV6vPrLrmq3It1RcnSMbLg6Cw+wCAFKhDxGX1ePGkPcEk1w
         dpL+QaSbznoFPyDJsxCrVKp5vvWTP3J4QiHULwt46x91/jxHJUQshqXowMzfQwtXPJ6e
         6fhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790627421; x=1791232221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQTC6j5DLlv+U5D0JiGxRJATLsn/7sTeYAzE/ml8ntk=;
        b=AuGBOh/PQhfe5Axlj9z+EwyDM3VGGdslCZ0qxSOFBJRle6R6QJPNfvGCB0T4th8fWZ
         FuksW39zCa82A6c+ICjQo4xXgN1PVa8WTrZl1wOqhq5eSQxw4YGGtn+/YtEW1GV/I+6k
         YM0JHSphcjTmclv7ewzG88pfQBuvK0dPf0At5bzE9IOtPTATQUzFSOFf/Wk1+C0sHkdN
         i0xy3Ah4rbHhDPSXu/7a50RAO28MuWsSTmLyfN7PgOIxl/paD2nTaV0WmFDHN+d1tpL1
         wT0VD40IUC01xt0UwouyT3P3FFbl/h6s3oBU7gMeZ5XtXq2k23K/X7sj+BbJ8ktxAFZe
         baxA==
X-Forwarded-Encrypted: i=1; AKwUvBwXDPK/pglOWBfj8WlcV2X33E2aAkVfCJitKWGoeeMP2nfvBu0B4QHTlzXD21wO1WphBdxHwgL0RLM0@lists.linux.dev
X-Gm-Message-State: AFq9FYJLmj7aEI7sQRJ6j61LZ1Bb0rsopnMEYPq539AVYTS+gzbHXkTX
	zH82Naj+B1gFf8zqqNMPPcRAOVytUNtIHkg8f6qWV22zLYpyKO3P+d62ppbcpvaxDzquHjUooDH
	gVOWYzhGLTCKyJ2TTa3V0W99Q4usFvUl7Nw==
X-Gm-Gg: AYBFou0XAmGLwhtXhCij6n5RzjLqzD2EwDH/odv+Q0Zh4efe25vdYbI8JhHNeqwX8r9
	8IDSmLhzLIsJFwYLa52FDTIVLweWJteWMwWKfppRgodCI6ovkWM0YdvJAwNlenLP8JQoypZZp0D
	BFZdAM6PrsRIgd88R75Ny1o/iT1bJFwqxtVs3sx6Xr4e1xDp+T9MBkLZaVTnWKfKtYgKP+a07Bk
	EiE8UWI2WvvhEiBmCKTVKMdwK4WWutzgayX7qgugStoSOZOFYu+9XWKjbeRRR8/s90RptkzClpE
	iSkdIXE+UPtu+uZB7R1dul0SP08sDs8ktdgeZxxe1BN/pDyKBuXpp4jJf004WxuZQTo=
X-Received: by 2002:a05:6402:2813:b0:6ac:a5a0:a1c6 with SMTP id
 4fb4d7f45d1cf-6aca5a0a2damr696487a12.8.1790627421250; Mon, 28 Sep 2026
 13:30:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKLmikMHpPdXmyPMPhad=wc_HerzCv3wEtp4s-E+NrjvuHj3pA@mail.gmail.com>
 <CAOQ4uxhx=bhNQ1G_fzUTtJexUpZANP1yBu5rK1Q0u4fk53umMw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhx=bhNQ1G_fzUTtJexUpZANP1yBu5rK1Q0u4fk53umMw@mail.gmail.com>
From: Mitar <mmitar@gmail.com>
Date: Mon, 28 Sep 2026 22:30:09 +0200
X-Gm-Features: AclHuK_SmDulH_Heag_Imv0Hs-aJLaXnLOS5RVdDhPv6uBy74iFk2y60X_H66Z8
Message-ID: <CAKLmikNsbZhrhFd92sXQw1AV00qwwww52m7Yv_mxcVcMC06=QQ@mail.gmail.com>
Subject: Re: [RFC] fuse: temporarily detaching a passthrough backing file
To: Amir Goldstein <amir73il@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

Thank you for your reply. I think I will have to process this for a
bit. I might figure out another approach to it.


Mitar

On Thu, Sep 24, 2026 at 12:14=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Wed, Sep 23, 2026 at 11:23=E2=80=AFAM Mitar <mmitar@gmail.com> wrote:
> >
> > Hi!
> >
> > I am writing a FUSE filesystem which stages what a command writes in
> > layers, so that the changes can be reviewed before they land on disk,
> > and I have been looking at whether FUSE_PASSTHROUGH can serve its data
> > path.  It cannot, and the reason seems general enough to ask about
> > here rather than work around locally.
> >
> > Once FOPEN_PASSTHROUGH has been granted for an open file, the server
> > cannot take it back.  FUSE_DEV_IOC_BACKING_CLOSE removes the id from
> > fc->backing_files_map and drops one reference (fuse_backing_close() in
> > fs/fuse/backing.c), while each open file keeps the reference it took
> > in fuse_passthrough_open(), released only when the file is closed.
> > None of the FUSE_NOTIFY_* messages reach it.  Granting passthrough is
> > therefore a promise that the backing file stays the correct target for
> > the entire life of every descriptor which gets it.
> >
> > There are two situations where a server cannot make that promise.
> >
> > 1) Quiescing, to make a consistent copy.  A server which snapshots,
> > backs up, or tiers the files it serves needs, at an instant of its
> > choosing, to stop writes reaching the backing file so that it can copy
> > it, and then let them continue.  With passthrough the server is not in
> > the write path, so its copy is torn; fsync does not help, since it
> > flushes rather than stops writers, and the only remaining option is to
> > freeze the whole workload from outside the filesystem, with the cgroup
> > freezer or similar.
>
> How does one make a consistent copy of a file in FUSE server
> regardless of FUSE passthrough?
>
> What counts as a torn write?
> FUSE server can gets part of the write while other are still in-flight.
> I think you'd have to at least have fsfreeze support in FUSE, or somethin=
g
> like this to even begin discussing this use case.
>
> >
> > 2) Re-targeting.  The file which ought to receive writes changes while
> > descriptors are open: a cache evicting or promoting a file, or a
> > stacking filesystem redirecting writes to a new layer.
> >
>
> I acknowledge the need, but as you write this is complicated.
>
> > Of the two, (1) seems the more general, and it is the one which does
> > not depend on any particular stacking design.
> >
> > What both would need is a way for the server to detach the backing
> > from the open files holding it, letting io fall back to ordinary
> > requests, and later to attach a backing again, either the same id or
> > another one.
> >
> > The io path looks mechanically simple, because it re-dispatches on
> > every call: fuse_file_write_iter() reads ff->passthrough per write, so
> > clearing it would send the next write through the connection.  What I
>
> Certainly doable but I wouldn't call it simple,
> It also brings odd semantics that the same open file (same inode number)
> can read two different contents - not sane semantics).
>
> > cannot judge is the rest.  fuse_file_passthrough() is a plain read of
> > ff->passthrough, so a detach would need something to serialise against
> > io already in flight, and the io mode transitions in fs/fuse/iomode.c
> > would have to be driven in both directions: out of uncached io mode on
> > detach, and back into it on attach, with the page cache invalidated in
> > between.  The kernel does already perform one such transition at
> > runtime by itself, when the first mmap of a FOPEN_DIRECT_IO file
> > enters caching io mode.
> >
> > mmap is the part I expect to be contentious.  A mapping is bound once:
> > backing_file_mmap() sets the vma's file and then runs the backing
> > filesystem's own ->mmap, so the vma ends up with that filesystem's
> > vm_ops and page tables into its address space, and nothing in the
> > fault
> > or writeback path consults the fuse file again.  A detach which
> > covered only the io path would therefore leave existing mappings
> > writing to the backing file.
> >
> > For (1) that is a bounded loss: only a process which mapped that file
> > MAP_SHARED for writing can still store into it during the copy, so the
> > copy of that one file may be inconsistent while every other file gets
> > a clean cut.  overlayfs documents a comparable deviation, in
> > "Non-standard
> > behavior" (b) of Documentation/filesystems/overlayfs.rst, where a
> > lower-layer file mapped MAP_SHARED does not see later changes.  For
> > (2) it is worse, since the mapping goes on writing to a file which
> > nothing resolves to any more.
> >
> > So my questions are:
> >
> >  - Is an interface of this kind of interest at all, or is "a backing
> > is forever" meant to be part of the contract, in which case it would
> > be worth saying so in fuse-passthrough.rst?
>
> It's like that because it's too complicated to deal with the consequences=
.
> Unless you prove otherwise...
>
> >
> >  - If it is of interest, would a detach which explicitly does not
> > affect existing mappings be acceptable, documented the way overlayfs
> > documents its deviation?  Or would mappings have to be handled, by
> > walking the backing inode's i_mmap, zapping and re-pointing the vmas,
> > for such an interface to be considered at all?
>
> No, I don't think we want to go there.
> and asI wrote, even the semantics without mmap can produce
> undesired no-standard behavior.
>
> >
> >  - What shape would be preferred: an ioctl beside
> > FUSE_DEV_IOC_BACKING_OPEN and _CLOSE taking a backing_id, a
> > FUSE_NOTIFY_* message on the connection, or something keyed by nodeid
> > rather than by backing_id?
>
> notify would have been enough if you managed to make the
> detach safe for races.
>
> >
> >  - Is there an existing way to get either of the two behaviours which
> > I have missed?
> >
>
> Not that I know of.
>
> Thanks,
> Amir.



--=20
https://mitar.tnode.com/
https://noc.social/@mitar
https://bsky.app/profile/mitar.bsky.social
