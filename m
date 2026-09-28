Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1854E73DA
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611465; cv=none; b=HsgY4tzQi2Sh0bKqqRi02g3QJO4anoHpAbe6t+6uggbV1fjcp4TJNNF7Cj1UmO4FbKlhmw1VE/5jThGWWD9paP/7TmblfaAG/b0yB6EvCA4pgr19ReI8v2A5CVkOwRkv3cAezJBBbt1CEmFdul5xg6vqigNdN3ITpb1EoJwhpkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611465; c=relaxed/simple;
	bh=w7TeqrT0+Q/zpFwxC4BFJzDfcPHp/MVfoWfOH4bg5mk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuZiP8GLHsMuWlypeVHKOYWfRxPKH4kZM4vnexn6G0bkD105ZzQZ1I0bDLohKDbUZ++48zR3QhjSDKGQ0eEdR2IIWXBm3N3G3Yny0W0ShllhIaAJjiGBBm0fCIU5e2MoH7WdiwSKL8xWS5CvUzv/VFve9d69SXn4u96Z421uDqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=Nl0qMGT3; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="Nl0qMGT3"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6595b0612so7654631fa.1
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1790611461; x=1791216261; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BriMvy/fYKfC0r2YX8o1wtevxh7lKkc9wmgSoWI89iY=;
        b=Nl0qMGT3/gHb3pVdMAzQF0DKaHa00CxXkumnTJfV42mdeIOo36PADmM9dF2bcHS0+t
         lLEHZs54tkj8cCT5fIA8WvK9gkj5MsUjMbEPjgClEa0CFIPN+YgB93mlpBZOx0CKfmKq
         UXhEico3AjKNctErsqIRR7i+Dhw7WH9CnV3C7ZjHQWsKholnQyO32BUnTudBcdJjSjUD
         uZ490f7mhFRhx7oPoG2tUjFUP7/twYdulVio0VmYk4bc8T9l1zPg6CmHHUjp6C3wWBWR
         MUm/BVYOQYjE/SfvwpXQsvnxZ5iQhKPGBXiwBmicwPWXHqyb/ZOtEdHc3Y3Hvc2iSjdU
         37Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611461; x=1791216261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BriMvy/fYKfC0r2YX8o1wtevxh7lKkc9wmgSoWI89iY=;
        b=CSZZVV69BkqF/oDvnH7Zs9a1KK2F5DxhSJ6hz1J0GbLoVOSucKo+2vwtOySPFijtIl
         XiikxOJSrjD/yIv8Q0rvCzmm1xd9dzku3NjCMtEzro8JPuasRO28ZxY2GOMoxO9pyWvV
         r9GccwOoIEEkEYAnu0pR439+9xlfEzAl+ppUE/yUVMe8I/20PS1TP8QOG90LPziyyxAv
         HyVwuB/k7aYUuyXimYtTeuCb5QnILCx/FkO0HS9heVkGLIjQbi9S+2B9pOoYY1TiyjCo
         wmM4AxPZCIM+TydAzlvAjU+w6CFBr/VYXApjdNpc9ImJgkhiFgDZgOxsdp0i4NTxiHmO
         ly0A==
X-Forwarded-Encrypted: i=1; AKwUvBzOSwNrGT4K4SW4BrxEUJPUlYJMwFIx/ZVcCO3kKEb4xNRgPnjnVHwActbYpc5wXGQwrnodyj8hAwOu@lists.linux.dev
X-Gm-Message-State: AFq9FYIDXztBm/dGahFCKxBWpnw1gSsR21pSm80AgD3Z4IrOi5lNjuu0
	jy7kEZuCeN7U4WSt6m2UKEpWE3kTxxm7A3ytx5Ruw2XDHf1f6XMH7HgqwFFLQb7OYXiq2hnGwwI
	F9tyvSd3CbqTLgw==
X-Gm-Gg: AYBFou3EbUTsSRIEYQFLZE5KAxt5J3snaiKRotjPkKgiYJOLfR/daHqUwhBf2t9IcyH
	CkZGbCKJIMkKt2uSRZ8deL/Qetq36deHqUKB/z0zSw1M9M9T1RAIAftI930CN/mH2ie9abDFSzD
	cmsjj4A1FyoBEQP8UHsQLS9kWPr0YpNFBz+eVdgdD+Jeze1RQap73mSKzcQtZc8VL/5FLq9eKiT
	2+PmVaE+wNGugyocXu34NfjEVebZIZFbzymsO82BFDBPVfxQ5Y3YWZ9M53lD0Z3qf2SWZ69wCLh
	heebwr0OGMBgPa4FC7JoksHWyZxilZtdL/vK9c/1fHFgA1LjqsnYWB/BINgZPYWWTW1sciDHVE9
	JBg6SEvYd/d87170+Sj3n/m9PjAoLvI8OanjQyQGr2YY/pfjZkH7JimIb3X3zurdF2a2mleQmpp
	TPrwqh8OuI/yMZOmtAtA7BQARc/i+yAdvrYoRzx/VbiSrNnSjx0ilT4J8oEXyPsrPPJbaU1rVje
	PxmsyR7NP27G1yuFPO9bJi4
X-Received: by 2002:a2e:a593:0:b0:3a6:d50:e26e with SMTP id 38308e7fff4ca-3a63bf1c44fmr31799421fa.2.1790611460947;
        Mon, 28 Sep 2026 09:04:20 -0700 (PDT)
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com. [74.125.230.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c31f0f7sm31240661fa.35.2026.09.28.09.04.15
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:04:18 -0700 (PDT)
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692e3so28211fa.0
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:04:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxOj7JmjSr9BflGS4qIhmNsK+dMYgaweH3gLBT2fg2ydl3BrHrh8UwHAz3+6YEzXJaRzrmUdfl+OMAN@lists.linux.dev
X-Received: by 2002:a2e:be83:0:b0:3a4:99bb:2821 with SMTP id
 38308e7fff4ca-3a63c09eb9bmr31672301fa.9.1790611455223; Mon, 28 Sep 2026
 09:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
In-Reply-To: <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
From: Russell Harmon <russ@har.mn>
Date: Mon, 28 Sep 2026 12:03:46 -0400
X-Gmail-Original-Message-ID: <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
X-Gm-Features: AclHuK_Zkx66j8fqE1hQWtePuXRLJqJWpqTyVuJzCfueMw32hJriOENdTx-0j2M
Message-ID: <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(re-sending in plaintext)

Thanks for the review! Comments inline.

On Mon, Sep 28, 2026 at 2:38=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> wrot=
e:
> >
> > This patch adds support for propagating the inode generation number fro=
m
> > the FUSE server to the kernel.
>
> Incomplete statement.
> Without the mention of GETATTR/SETATTR this is a misleading statement.
>
> > This is useful for exporting FUSE
> > filesystems over NFS, where the generation number is used to detect
> > stale file handles (ESTALE) when inodes are recycled.
>
> How exactly does it help?
> I am not trying to troll you, I am really curious. how?
>
> Context: I have been trying to improve FUSE NFS export support for a whil=
e
> I have built a library that provides reliable NFS export for FUSE passthr=
ough fs
> for specific backing file system types [1].
>
> [1] https://github.com/amir73il/libfuse/tree/libfuse_passthrough/passthro=
ugh
>
> It is broadly understood that real NFS export support requires extending =
the
> FUSE protocol to identify objects using file handles and Luis has
> already started
> with this work [2]
>
> [2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@iga=
lia.com/
>
> So my question is, what does adding generation id to GETATTR/SETATTR
> improve for FUSE filesystem writers that wish to export their filesystem =
to NFS?

Long answer is https://russ.har.mn/blog/2026-04-09/fuse-loopback-is-incompl=
ete

Short answer is that inode on its own doesn't uniquely identify a
file. The unique identifier is inode + generation. Reason being that a
user can delete a file and create a new one, and the filesystem is
allowed to reuse the inode (but if it does it must use a different
generation).

As for why it needs to be a part of GETATTR/SETATTR, consider that,
given the above, without a generation number such calls are actually
ambiguous. They don't uniquely identify a filesystem object. e.g.
"what are you asked to GETATTR/SETATTR _on_?"

> >
> > Key changes:
> > - Bump FUSE protocol version to 7.47.
> > - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
> >   `generation`.
> > - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem opts
> >   into the kernel consuming that field. Gating on the protocol minor
> >   version alone would break existing filesystems: the minor version onl=
y
> >   reflects the library, not whether the individual filesystem fills the
> >   field, and a zero there would look like a generation change for any
> >   filesystem that reports nonzero generations in LOOKUP.
> > - Update `fuse_change_attributes` and related functions to accept and s=
et
> >   `inode->i_generation`.
> > - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
> >   responses.
> > - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
> >   `fuse_stale_inode()`, the same check already used by the `LOOKUP` and
> >   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merging
> >   the recycled file's attributes into the existing, possibly still-open=
,
> >   inode.
> > - Update `fuse_get_dentry` to validate the generation number against th=
e
> >   file handle, returning ESTALE on mismatch.
> > - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
> >   generation field in attr replies is ignored.
> >
> > Verification:
> > Tested with a QEMU harness in fuse-generation-qemu against a patched
> > libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) and
> > its passthrough_ll example reporting real backing-filesystem generation
> > numbers. The suite verifies that:
> > 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
> >     handles and matches the backing filesystem's FS_IOC_GETVERSION.
> > 2.  `open_by_handle_at()` succeeds for a valid handle and fails with
> >     ESTALE for a handle whose generation does not match, both while the
> >     inode is cached and after cache eviction.
>
> 1 and 2 should work on upstream FUSE right?
> This is something worth mentioning.
>
> > 3.  When a `GETATTR` reply reports a new generation for a cached inode
> >     (inode recycling), the kernel marks the inode bad: fstat() on an
> >     open fd fails with EIO, while a fresh path lookup recovers and
> >     pre-recycling file handles fail with ESTALE.
>
> How did the inode recycle happen with passtrhough_ll which keeps
> open fds for fuse inodes?
> Something is missing from this test report.
> If you just used a mock filesystem which makes no sense in the real world
> then the value of this change is questionable.

Ack, I'll dig more into this. Sending responses to your other
questions now and will reply again once I've got an answer.


> > Signed-off-by: Russell Harmon <russ@har.mn>
> > Assisted-by: Gemini:gemini-3.1
> > ---
> > v2:
> > - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 changelog
> >   entry (v1 added the entry but left the minor at 46).
> >
> > v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.mn/
> >
> >  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++++
> >  fs/fuse/dir.c                           | 21 +++++++++++-----
> >  fs/fuse/fuse_i.h                        | 10 ++++++--
> >  fs/fuse/inode.c                         | 23 ++++++++++++------
> >  fs/fuse/readdir.c                       |  2 +-
> >  include/uapi/linux/fuse.h               | 11 +++++++--
> >  6 files changed, 81 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/fi=
lesystems/fuse/fuse.rst
> > index 0fbd5a03fdc9..f67bc9fc6316 100644
> > --- a/Documentation/filesystems/fuse/fuse.rst
> > +++ b/Documentation/filesystems/fuse/fuse.rst
> > @@ -49,6 +49,38 @@ using the sftp protocol.
> >  The userspace library and utilities are available from the
> >  `FUSE homepage: <https://github.com/libfuse/>`_
> >
> > +NFS export support
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +FUSE filesystems can be exported via NFS if the filesystem daemon supp=
orts it.
> > +For reliable NFS export, the filesystem should provide a unique inode
> > +generation number for each inode. This generation number is used by th=
e
> > +NFS server to distinguish between different file instances that may
> > +share the same inode number (e.g. after an inode number is reused).
> > +
> > +The inode generation number is provided by the filesystem daemon in th=
e
> > +following messages:
> > +
> > +- `FUSE_LOOKUP`
> > +- `FUSE_GETATTR` (see below)
> > +- `FUSE_SETATTR` (see below)
> > +- `FUSE_READDIRPLUS`
> > +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FUSE=
_SYMLINK` / `FUSE_LINK`
> > +
> > +A daemon that keeps the generation number in its `FUSE_GETATTR` and
> > +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
> > +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` in
> > +its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
> > +compares the generation in every getattr/setattr reply against the
> > +cached inode: a mismatch means the daemon has reused the node ID for a
> > +different file, and the cached inode is marked bad (subsequent
> > +operations on it fail with EIO). Without the flag, the field is ignore=
d
> > +and the generation is only taken from lookup-type replies, preserving
> > +the behavior of existing filesystems.
> > +
> > +If the filesystem daemon does not provide a generation number, the ker=
nel
> > +will use a default value of 0.
> > +
>
> On the one hand, I still need to understand the value of reporting genera=
tion
> in GETATTR/SETATTR.
>
> On the other hand, I do see the value in the server negotiating at init t=
ime the
> fact that "Generation values are reliable".
>
> What happens today is that NFS exporting is allowed for all FUSE filesyst=
ems
> regardless of the reliability of generation id, so after inode evict
> and recycle,
> an NFSv3 client  that had access to inode X.Y may get access to a complet=
ely
> different file or even a directory with inode X.Y, where X is the recycle=
 nodeid
> and Y is an unreliable generation provided by the server.
>
> The problem is that FUSE does not require opt-in for NFS export, it only
> allows servers to opt-out of NFS export (FUSE_NO_EXPORT_SUPPORT).
>
> So what can be done given a declaration of the server that generation
> is reliable?
>
> One option is to set a non-zero uuid/fsid to the fuse filesystem.
> This will allow exporting the fuse filesystem without the opt-in uuid/fsi=
d=3D
> in /etc/exports.
> This will also allow setting fanotify FAN_MARK_FILESYSTEM watches
> on this fuse filesystem, whose file handles could be trusted to be a genu=
ine
> unique identity of the filesystem objects.
>
> But if we take this route, it is better to take it one step further
> and allow the
> server to determine the filesystem uuid/fsid during negotiation.
>
> In any case, I am not convinced there is value in doing all this
> without extending
> the protocol with LOOKUP_HANDLE/LOOKUPX lookup by file handle, so if you
> have compelling use cases, please spell them out.

I'm trying to implement a caching filesystem which uses a sqlite
database (stored on an SSD) to cache all file and directory metadata,
ultimately to avoid HDD spinups (and the associated electricity cost)
for operations other than file reads. I'm also exporting this
filesystem over NFS, hence the need for NFS support.

If I remember correctly, name_to_handle_at on a FUSE filesystem
contains just the inode+generation, and open_by_handle_at results in a
LOOKUP of that inode (and now inode+generation). But I'll
double-check. Assuming my memory is correct, I think that's
sufficient, assuming that we consider inode+generation as a unique
file object identifier.
