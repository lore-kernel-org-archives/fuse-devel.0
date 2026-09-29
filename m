Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735373A5E9F
	for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 20:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790715356; cv=none; b=hzfyzKCbrF3Yh49PVDfMvv5Lcv6JbqtzJjM8fPgfKi/vDySd/2pBOsYt252EGq4Z5S96Mki5ZCak2LLEf+89DsZe8Xq9LkROOzaoGr1XHMSA3N88CLKdP3zlL8lClccRr932VcSlyeY1fZm6qNtQqtdTD4iEu2G7e9UhpV6lbfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790715356; c=relaxed/simple;
	bh=fmjR5znDuXAP+eGjxPWNBzmgAiD4HsAGBUk7tghgSfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POhxsKLB5usuRGaNb7sus0SLf1nX9T65MchTBmUSh9syDxSzZzwCvQne/tXJG4qepKtLapowHOzW39Yoobb/419kv/ZirYrb6cN71MjX0TK9T5NJ1ojhuSucFXrg2Ypcztv5vRxqbm3Ej7OA1EZcQ7tzOARq97WCkyGNze5cYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn; spf=pass smtp.mailfrom=har.mn; dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b=clQBa9tt; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=har.mn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=har.mn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=har.mn header.i=@har.mn header.b="clQBa9tt"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a772de44c5so999531fa.1
        for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 13:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=har.mn; s=google; t=1790715352; x=1791320152; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jHb5XJ9mbC6EVlnTfZ+WcK6KQ0TTrHYytvslAEWIq0=;
        b=clQBa9ttUAUX5Uj9DQopIhRwT9kXtg2nrype2zdP0YTIScOm49zmv2E/roFZWtH9J6
         pvnj3PAymc7URm0i+Il3uckpb2COX82VPPwOeHJscYNGprZVY3by//u8k4tBN+RBWIma
         0Hd8HrTRdXjQo3FgBrpQdnfUTP+88nBzJlqHq3S8Gn7ACABtRykEeiIuId96cq9go1Lr
         URA1b/rn/x7+TOP9v7XT7z88n6WXGYejqDYOqkYrQXw24Iq8rzqndMu49vKUhNkOJ237
         KgS2LPHNIPYev8sYHB4rMudpHwo+1yofyNMIWjbDqvmI+/BVbDg7UI2hh57OgZbNC2RI
         SUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790715352; x=1791320152;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jHb5XJ9mbC6EVlnTfZ+WcK6KQ0TTrHYytvslAEWIq0=;
        b=YbvQ46bdmmzwE+EGtXhQWrwjpes5OJXzxXbGa+ykSJJ5fmEHG7r8WSJcsdQhDmuD1l
         sd76WmU4FpeMNc+EPRAxDz7bqfQ6Jz1aCvrMYEfPBQtxalSfpfLZC7po/RuPqItXfxgc
         QM1jzIlEZj0pORoKdhImIfizG0PDKI8bHcNgutWSG1x/XhQBX5IPGln8ZR1ic7fN7y/8
         6VGf3reIvpbGGx0Ca4hE87j6bltnFo0FT5//ED+FtkB3GDffeZpWEQfDRNG++AQnHQsy
         pR/0pGN2oc+VBXhhZdkem6Xvt6ues7qfnPJ8G6S+twhKDNtpEhX0sVA5xv3om4rrTLXr
         6qbA==
X-Forwarded-Encrypted: i=1; AKwUvBwZTBzQePZ/y4D6m3NqXtLsLLKSMg4nLPWdoMJ4gZZWu1YTFe+p9m68iImyf8WWM4ZCfM30YxJoVPJC@lists.linux.dev
X-Gm-Message-State: AFq9FYIRJc9kwZWWEwPcDFcuZgsyLS67P5zPyqUPDl05qLMe5xiionGx
	1M4+rEeNDdAPJV7FQFI8Gvkl/82E+7lbK0qOJ42W7BAh2UdukMEmzxnoVT9IzYOTyDRtPbsiUva
	5hEF0cXsA
X-Gm-Gg: AYBFou1afX7SRydTTaDPBMOsZ4UMXfCizRsgPanri0eeOOMqYut5ADFFzeLxjv9unLZ
	tJjmDeXmCj8lCchH0x5PYIRW3Fm/t1Mj90UCY6DXbSu37zupqzABmGPQhj+G12e6MoLeOucCoo7
	4GIa8skpO7MinI/7JkPYaP+x7uJ+PkyZxgcY8OR6n2QdTYzwkKmdVRLCFpK/T7x1ur+tz5la7Vd
	UaBvJHIXnsQPTNAuAQI3pjeQ0qpXeTZMU0z4pa7MT2RK3PKIZE0awVnjPK9imemoDXo7bca/Tpl
	0Rt6IhCTJT8RdWDD6T9PrkujfFmS3by4ykan4LWCYJXM68YOEVZj5MsiA/+uGIlXv1pk3a6/zvY
	3jOslYKnCPUrk7BHyVk5u+WJKhY1ZLHhHyit/4m9ImRJoHZMIuusFc1u9MlhuijMfXM8Si/Y7mB
	OkBqCLTYBey077yrtde4crLy9rf/NZ9WiXW+YScXHzdL61sZmxpRSMK860OjZsvQNHDOaYihexA
	B/jFDbL9ZAraU48APsXb0Y38T6fK4RI8vE=
X-Received: by 2002:a05:651c:a103:20b0:3a5:b6af:2973 with SMTP id 38308e7fff4ca-3a77177f22emr1159181fa.5.1790715352350;
        Tue, 29 Sep 2026 13:55:52 -0700 (PDT)
Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com. [74.125.230.98])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a771934cdbsm1693581fa.31.2026.09.29.13.55.50
        for <fuse-devel@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 13:55:51 -0700 (PDT)
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a772de44c5so999281fa.1
        for <fuse-devel@lists.linux.dev>; Tue, 29 Sep 2026 13:55:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxY/KFmTpVhOMfzybDpt1ZG3TaHQO8jWDDaGA27KdmMdMnBEp76IOn59boEmeEZ6cIgI3fpNkqdFJWk@lists.linux.dev
X-Received: by 2002:a05:651c:4214:b0:3a6:566a:5ca1 with SMTP id
 38308e7fff4ca-3a77191a593mr1463641fa.21.1790715350365; Tue, 29 Sep 2026
 13:55:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
 <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
 <CA+zrezRqjY3_V1cDRpTVsXY-d_2CEVkhPqjWiztuKH1CG63jUQ@mail.gmail.com> <CAOQ4uxj4xQ9Z=9JH=U21iHnfLBQLboz5dsivigKicWS22M+zgQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxj4xQ9Z=9JH=U21iHnfLBQLboz5dsivigKicWS22M+zgQ@mail.gmail.com>
From: Russell Harmon <russ@har.mn>
Date: Tue, 29 Sep 2026 16:55:23 -0400
X-Gmail-Original-Message-ID: <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
X-Gm-Features: AclHuK_-sxgW41FSNSTiQINVXT69kVMm9iJRYozv6Nn2_kkXLQhD03LnrOFFrWg
Message-ID: <CA+zrezR3vZOH4-DJbu7kRu=qXF4RSWUxz3BjpnOou_vy6eDcwQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:54=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Mon, Sep 28, 2026 at 6:04=E2=80=AFPM Russell Harmon <russ@har.mn> wrot=
e:
> >
> > (re-sending in plaintext)
> >
> > Thanks for the review! Comments inline.
> >
> > On Mon, Sep 28, 2026 at 2:38=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> =
wrote:
> > > >
> > > > This patch adds support for propagating the inode generation number=
 from
> > > > the FUSE server to the kernel.
> > >
> > > Incomplete statement.
> > > Without the mention of GETATTR/SETATTR this is a misleading statement=
.
> > >
> > > > This is useful for exporting FUSE
> > > > filesystems over NFS, where the generation number is used to detect
> > > > stale file handles (ESTALE) when inodes are recycled.
> > >
> > > How exactly does it help?
> > > I am not trying to troll you, I am really curious. how?
> > >
> > > Context: I have been trying to improve FUSE NFS export support for a =
while
> > > I have built a library that provides reliable NFS export for FUSE pas=
sthrough fs
> > > for specific backing file system types [1].
> > >
> > > [1] https://github.com/amir73il/libfuse/tree/libfuse_passthrough/pass=
through
> > >
> > > It is broadly understood that real NFS export support requires extend=
ing the
> > > FUSE protocol to identify objects using file handles and Luis has
> > > already started
> > > with this work [2]
> > >
> > > [2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis=
@igalia.com/
> > >
> > > So my question is, what does adding generation id to GETATTR/SETATTR
> > > improve for FUSE filesystem writers that wish to export their filesys=
tem to NFS?
> >
> > Long answer is https://russ.har.mn/blog/2026-04-09/fuse-loopback-is-inc=
omplete
> >
> > Short answer is that inode on its own doesn't uniquely identify a
> > file. The unique identifier is inode + generation. Reason being that a
> > user can delete a file and create a new one, and the filesystem is
> > allowed to reuse the inode (but if it does it must use a different
> > generation).
>
> This is obvious. That's the reason LOOKUP already returns a generation.
>
> >
> > As for why it needs to be a part of GETATTR/SETATTR, consider that,
> > given the above, without a generation number such calls are actually
> > ambiguous. They don't uniquely identify a filesystem object. e.g.
> > "what are you asked to GETATTR/SETATTR _on_?"
> >
>
> You phrased the question correctly, but the same question
> applies to any other command, i.e.
> "What are you asked to OPEN/TRUNCATE _on_?"
>
> So you see, what's needed is to change the input argument
> of ALL the fuse requests from nodeid to nodeid+generation, or
> in the more generic form of NFS handles, a variable size object id blob.

Yes, fair, we'll need to change all the fuse requests.

> This is from the latest proposal for FUSEX protocol [3]
>
> struct fusex_id {
>     u64 nodeid;
>     /* will extend with file handle */
> };
>
> [3] https://lore.kernel.org/fuse-devel/20260429102058.1362965-1-mszeredi@=
redhat.com/
>
> > > >
> > > > Key changes:
> > > > - Bump FUSE protocol version to 7.47.
> > > > - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
> > > >   `generation`.
> > > > - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem =
opts
> > > >   into the kernel consuming that field. Gating on the protocol mino=
r
> > > >   version alone would break existing filesystems: the minor version=
 only
> > > >   reflects the library, not whether the individual filesystem fills=
 the
> > > >   field, and a zero there would look like a generation change for a=
ny
> > > >   filesystem that reports nonzero generations in LOOKUP.
> > > > - Update `fuse_change_attributes` and related functions to accept a=
nd set
> > > >   `inode->i_generation`.
> > > > - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLU=
S`
> > > >   responses.
> > > > - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
> > > >   `fuse_stale_inode()`, the same check already used by the `LOOKUP`=
 and
> > > >   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merg=
ing
> > > >   the recycled file's attributes into the existing, possibly still-=
open,
> > > >   inode.
> > > > - Update `fuse_get_dentry` to validate the generation number agains=
t the
> > > >   file handle, returning ESTALE on mismatch.
> > > > - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` t=
he
> > > >   generation field in attr replies is ignored.
> > > >
> > > > Verification:
> > > > Tested with a QEMU harness in fuse-generation-qemu against a patche=
d
> > > > libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation)=
 and
> > > > its passthrough_ll example reporting real backing-filesystem genera=
tion
> > > > numbers. The suite verifies that:
> > > > 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
> > > >     handles and matches the backing filesystem's FS_IOC_GETVERSION.
> > > > 2.  `open_by_handle_at()` succeeds for a valid handle and fails wit=
h
> > > >     ESTALE for a handle whose generation does not match, both while=
 the
> > > >     inode is cached and after cache eviction.
> > >
> > > 1 and 2 should work on upstream FUSE right?
> > > This is something worth mentioning.
> > >
> > > > 3.  When a `GETATTR` reply reports a new generation for a cached in=
ode
> > > >     (inode recycling), the kernel marks the inode bad: fstat() on a=
n
> > > >     open fd fails with EIO, while a fresh path lookup recovers and
> > > >     pre-recycling file handles fail with ESTALE.
> > >
> > > How did the inode recycle happen with passtrhough_ll which keeps
> > > open fds for fuse inodes?
> > > Something is missing from this test report.
> > > If you just used a mock filesystem which makes no sense in the real w=
orld
> > > then the value of this change is questionable.
> >
> > Ack, I'll dig more into this. Sending responses to your other
> > questions now and will reply again once I've got an answer.
> >
> >
> > > > Signed-off-by: Russell Harmon <russ@har.mn>
> > > > Assisted-by: Gemini:gemini-3.1
> > > > ---
> > > > v2:
> > > > - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 change=
log
> > > >   entry (v1 added the entry but left the minor at 46).
> > > >
> > > > v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.m=
n/
> > > >
> > > >  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++=
++++
> > > >  fs/fuse/dir.c                           | 21 +++++++++++-----
> > > >  fs/fuse/fuse_i.h                        | 10 ++++++--
> > > >  fs/fuse/inode.c                         | 23 ++++++++++++------
> > > >  fs/fuse/readdir.c                       |  2 +-
> > > >  include/uapi/linux/fuse.h               | 11 +++++++--
> > > >  6 files changed, 81 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentatio=
n/filesystems/fuse/fuse.rst
> > > > index 0fbd5a03fdc9..f67bc9fc6316 100644
> > > > --- a/Documentation/filesystems/fuse/fuse.rst
> > > > +++ b/Documentation/filesystems/fuse/fuse.rst
> > > > @@ -49,6 +49,38 @@ using the sftp protocol.
> > > >  The userspace library and utilities are available from the
> > > >  `FUSE homepage: <https://github.com/libfuse/>`_
> > > >
> > > > +NFS export support
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +FUSE filesystems can be exported via NFS if the filesystem daemon =
supports it.
> > > > +For reliable NFS export, the filesystem should provide a unique in=
ode
> > > > +generation number for each inode. This generation number is used b=
y the
> > > > +NFS server to distinguish between different file instances that ma=
y
> > > > +share the same inode number (e.g. after an inode number is reused)=
.
> > > > +
> > > > +The inode generation number is provided by the filesystem daemon i=
n the
> > > > +following messages:
> > > > +
> > > > +- `FUSE_LOOKUP`
> > > > +- `FUSE_GETATTR` (see below)
> > > > +- `FUSE_SETATTR` (see below)
> > > > +- `FUSE_READDIRPLUS`
> > > > +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `=
FUSE_SYMLINK` / `FUSE_LINK`
> > > > +
> > > > +A daemon that keeps the generation number in its `FUSE_GETATTR` an=
d
> > > > +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
> > > > +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION=
` in
> > > > +its `FUSE_INIT` reply flags. When the flag is negotiated, the kern=
el
> > > > +compares the generation in every getattr/setattr reply against the
> > > > +cached inode: a mismatch means the daemon has reused the node ID f=
or a
> > > > +different file, and the cached inode is marked bad (subsequent
> > > > +operations on it fail with EIO). Without the flag, the field is ig=
nored
> > > > +and the generation is only taken from lookup-type replies, preserv=
ing
> > > > +the behavior of existing filesystems.
> > > > +
> > > > +If the filesystem daemon does not provide a generation number, the=
 kernel
> > > > +will use a default value of 0.
> > > > +
> > >
> > > On the one hand, I still need to understand the value of reporting ge=
neration
> > > in GETATTR/SETATTR.
> > >
> > > On the other hand, I do see the value in the server negotiating at in=
it time the
> > > fact that "Generation values are reliable".
> > >
> > > What happens today is that NFS exporting is allowed for all FUSE file=
systems
> > > regardless of the reliability of generation id, so after inode evict
> > > and recycle,
> > > an NFSv3 client  that had access to inode X.Y may get access to a com=
pletely
> > > different file or even a directory with inode X.Y, where X is the rec=
ycle nodeid
> > > and Y is an unreliable generation provided by the server.
> > >
> > > The problem is that FUSE does not require opt-in for NFS export, it o=
nly
> > > allows servers to opt-out of NFS export (FUSE_NO_EXPORT_SUPPORT).
> > >
> > > So what can be done given a declaration of the server that generation
> > > is reliable?
> > >
> > > One option is to set a non-zero uuid/fsid to the fuse filesystem.
> > > This will allow exporting the fuse filesystem without the opt-in uuid=
/fsid=3D
> > > in /etc/exports.
> > > This will also allow setting fanotify FAN_MARK_FILESYSTEM watches
> > > on this fuse filesystem, whose file handles could be trusted to be a =
genuine
> > > unique identity of the filesystem objects.
> > >
> > > But if we take this route, it is better to take it one step further
> > > and allow the
> > > server to determine the filesystem uuid/fsid during negotiation.
> > >
> > > In any case, I am not convinced there is value in doing all this
> > > without extending
> > > the protocol with LOOKUP_HANDLE/LOOKUPX lookup by file handle, so if =
you
> > > have compelling use cases, please spell them out.
> >
> > I'm trying to implement a caching filesystem which uses a sqlite
> > database (stored on an SSD) to cache all file and directory metadata,
> > ultimately to avoid HDD spinups (and the associated electricity cost)
> > for operations other than file reads. I'm also exporting this
> > filesystem over NFS, hence the need for NFS support.
>
> OK, so you are implementing a passthrough filesystem (to HDD)
> with a fast caching layer, I assume to cache results of GETATTR/
> LOOKUP/READDIR/READDIRPLUS? Anything else?
> Are you caching a specific type of backing filesystem?
>
> I advise you to look at libfuse_passthrough [1].
> You can either see if it fits you or learn from my experience with NFS
> export of a fuse passthrough filesystem.
> I am giving a talk on the subject in Linux Plumbers next week [4].
>
> >
> > If I remember correctly, name_to_handle_at on a FUSE filesystem
> > contains just the inode+generation, and open_by_handle_at results in a
> > LOOKUP of that inode (and now inode+generation). But I'll
> > double-check. Assuming my memory is correct, I think that's
> > sufficient, assuming that we consider inode+generation as a unique
> > file object identifier.
>
> The problem is, that what you assume is not an API definition, this is
> a specific
> filesystem implementation, which happens to be correct for some commonly
> used filesystems (e.g. ext4, xfs), but is not true in general.
> In general the API {name_to,open_by}_handle_at() the file handle is an
> opaque blob.

Maybe I'm thinking about this backwards, but we're not talking about
"any" filesystem here. We're talking about the FUSE filesystem where
the definition of a handle _is_ inode+generation. All I'm proposing we
do is to expose that fact to the FUSE userspace daemon. That daemon
can then turn around and call open on another filesystem, or make a
network call to AWS or whatever. In my case I want to
open_by_handle_at on an underlying filesystem, but I can solve that by
storing a mapping from fuse_ino+fuse_generation_num to
underlying_fs_file_handle in my database.


> The way that libfuse_passthrough gates against recycled inode numbers
> is that the file handle is stored in the server's inode table at lookup t=
ime
> (generation is recorded) and all the commands that follow, lookup in the
> server's inode table (could be in sqlite in your case) and use
> open_by_handle_at() with the recorded file handle from lookup time
> to get an O_PATH fd to the object on the backing filesystem (on HDD).
>
> This is called InodeRef in libfuse_passthrough and any request will retur=
n
> ESTALE to the kernel if it cannot get an InodeRef.
>
> Thanks,
> Amir.
>
> [4] https://lpc.events/event/20/contributions/2367
