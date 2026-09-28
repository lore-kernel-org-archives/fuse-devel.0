Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B7B48FF71
	for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 09:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588325; cv=pass; b=mKVey9uApjzMawWgy81xYQZ70QJNxIiatIokbwXlh/1KEHnmwxzQCbacmFyvDLv9pQPCCFmWgCwhehhUeb+dy0+stDMHbGEWo3bQM3/BqGYla1Lu0IjBqS6/PCPSyoDWOGROtM86qxsVJ0tF5mNJikx6dxXYfOe8a0ZCZeBSX6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588325; c=relaxed/simple;
	bh=gb6048TDzYlgycuIW+LHs5ZmNznTudpMWjLZxgLAZuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dChNMMEeEguFE3I6Dyh+OYAIbzMM+wg/7Nbz4FzSYASVw1a6tmsYg+t1r9dJZ6B4LEBJ5hKFxs3EeurbPg47l1O0QQRcr/+Z9OB3mAoYSbnyYOZVOdT4naMvSrUfDIOQZmu1DAAxU5Q/AegualaHpYgyy9N3A3ghmpvGm4REWrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGwyW8Qz; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGwyW8Qz"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so3375846a12.2
        for <fuse-devel@lists.linux.dev>; Mon, 28 Sep 2026 02:38:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790588322; cv=none;
        d=google.com; s=arc-20260327;
        b=nAhmtQUdHeIC7nVulh3nYLzfVMxk1DkRKZisPlZ79+9dqDfAWTuxxZRzf2wOXcwoPC
         +CM/7frKpX1RH8OA7aZcLikC9coHxEfTRQX7wNVm1r4wLVH+9/ISGRWJgFNrFYOIy1dB
         UjEuO38YurrOXO3ykShIs1e0PRc5NwYRfLm87k1LVq3JJcFl2oc9vF7V/5+WbGxi8QYY
         cLY89//8U40xHQQsIH/RNSdFFfU+COP+TBoJ5Cdovcj0tmwO6lacFxcyEYZdsem7od7o
         7R+bZwltBggEEckiX1buiQcuWTUNLLl9XsFMaLOMcdsghG6HMI/FM/yW7baWPOukbwH6
         n45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hKDPUtqRH0gCyeriwhHpNabxiyuB4wCzvkW0lk6SNbg=;
        fh=bTDEAzqENzCREpvyZfXaizZPuVINg4CBjy5z4a1TX9g=;
        b=gA3umskoB4sTerCQRJ5f/Mmxk3Bc9npVHqnNh3Q6aOAwiwJCjoQjsiskIHp25ptCZv
         D6DmCDJLQ4of7YBKJxcxlMoR/mJApT4h2APvCb5BjOeY+DPRutg5eTnZp+390vgBIjGo
         VwaaaFVrVPKsGr6tzKUwjOyPPhBoH7CnEgztnIiLP2MrS7XiAF6Gg1val9+NOsHRIpqZ
         fkbU9MT0zMtMjIXDdtcRRPgviOBjTcj4PkQvSuwTKdY4EwrLBMY09bU2i+EKSfAqW8GT
         CpcD7LxEPmJXPt1S3/5xwD3l6Kliset/8JqyfzTV34g6LWkZdBVskZTZSqSbbqAVWR8e
         yPIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790588322; x=1791193122; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKDPUtqRH0gCyeriwhHpNabxiyuB4wCzvkW0lk6SNbg=;
        b=dGwyW8QzSWHeWx5thRXkJfdKYFYZKoA6EBKswzblFuprSL+DKrw73t0Y99+gj9KbFS
         BXq/zfvM+T3TAUzg6oL3NA8Y6p8fEA+lStj38Jpn8Gcl1moKDlvOntcHTBG2LuKM7wD7
         6LSCHTBrGzwBa/w51RN9VR+JAvjZAM8O19yJi7WlPjf6Mn67/6Y4tlAq+L3bcNtYVpjo
         U7ZE5DpnhP3J21tsZpjpGQD5UqA7bO93T+d9kfaqy5arXf8fyD+i7uvVqpe0P4IFtTGz
         9W5i9r03e1YeW7DxKAeB9hF5JWe6uFXgxXIYtxVrRTe7/O5lz7dAbUyBUBvz2fQB6OoR
         qOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790588322; x=1791193122;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKDPUtqRH0gCyeriwhHpNabxiyuB4wCzvkW0lk6SNbg=;
        b=zbmM6XYL6VlUXTa0QHvi2u5aLMP0/iVj2vNEpQggiaAumfxsQF9NylmbXZq0y96X+r
         2eYGFr+eQGyBq2Zy+9O58lIozZnXDRjx6scLL+D/7M7nd9BME7Sp+9jh+VhCm0M4DulO
         QXT7WQZKsPbYr/g8eInFCWXnVCScXwtQy2uae35PpOXETm9dX+F35zinz+rfeMHmbIoV
         vYAn6g+DKIOI231+9GJLogNNXQPrY5cxyx+Tf1TmUOiifbagnNN3p4BiEbm0+ykMZrw7
         CbaKi/F7vVfx2QTCeuWqak4lwkffmh1XAcp7fg3KC+XetQtkRe6q6TZ4I8dZBJXNivAB
         95/Q==
X-Forwarded-Encrypted: i=1; AKwUvByAvlVpfFPJXu60QdVBaODoaNXdVXM0SIXCbv/7iU6lXUKppJWDOIRqj1TQGrCjDri4IJQqx1/o07CI@lists.linux.dev
X-Gm-Message-State: AFq9FYJQxjuowMYuuCIsUV585e/+LaePmAg+c33hiQTVKBmJaM/w46RH
	7l5ybVoYX0K+Tjx2QehXO3Z/8v85kI0KHsrXx+WjGe90LrExfR2+7ifkcuW2yLILlj4MsUhbX9j
	Jsf1y7hkKgHDQmxPVUiT7A34W9g4N0Bk=
X-Gm-Gg: AYBFou3bIdQSCqeAupJIt/8qjx3R7cZEWwvhWeNP2kW062p3sywCwtsg7iiEa42hN3f
	MMwytWnY9ifaeZw4HwWx178Tz28ZIOPEoGEIEs7DBSkdjZYxJXx8EZP4foTvNhCc0Isdaj04puy
	H/Z80sJ8k8b2W+0qL97oYxrxBQeFXCoctbu3P/wMl4kOV5b/EjDVTL6umvYGOsyhNrjay7fMlmz
	eAPumxULA7q0s2pE6v94pEPEoKHjNuGGFKrbDTUjPy0xteVEE8wiktk78lF8t9pnUCgbSZmJIpo
	WdiqgUaV5mFSN7N+6/s9+X/4LxzALIAtJ42vHqvF8abgzCqEfARozjNH
X-Received: by 2002:a05:6402:2112:b0:6ac:73f8:2e5a with SMTP id
 4fb4d7f45d1cf-6ac73f831f7mr2844331a12.41.1790588321442; Mon, 28 Sep 2026
 02:38:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260927141437.1432584-1-russ@har.mn> <20260928014357.2285448-1-russ@har.mn>
In-Reply-To: <20260928014357.2285448-1-russ@har.mn>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 28 Sep 2026 11:38:30 +0200
X-Gm-Features: AclHuK_FhmfwqFXI5b-5yRrCn8vRB0dEKaDQXuuiyccQhL2aHv2Nq8mRUxiiswc
Message-ID: <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
To: Russell Harmon <russ@har.mn>
Cc: miklos@szeredi.hu, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, fuse-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bernd Schubert <bernd@bsbernd.com>, 
	Luis Henriques <luis@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> wrote:
>
> This patch adds support for propagating the inode generation number from
> the FUSE server to the kernel.

Incomplete statement.
Without the mention of GETATTR/SETATTR this is a misleading statement.

> This is useful for exporting FUSE
> filesystems over NFS, where the generation number is used to detect
> stale file handles (ESTALE) when inodes are recycled.

How exactly does it help?
I am not trying to troll you, I am really curious. how?

Context: I have been trying to improve FUSE NFS export support for a while
I have built a library that provides reliable NFS export for FUSE passthrou=
gh fs
for specific backing file system types [1].

[1] https://github.com/amir73il/libfuse/tree/libfuse_passthrough/passthroug=
h

It is broadly understood that real NFS export support requires extending th=
e
FUSE protocol to identify objects using file handles and Luis has
already started
with this work [2]

[2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@igali=
a.com/

So my question is, what does adding generation id to GETATTR/SETATTR
improve for FUSE filesystem writers that wish to export their filesystem to=
 NFS?

>
> Key changes:
> - Bump FUSE protocol version to 7.47.
> - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
>   `generation`.
> - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem opts
>   into the kernel consuming that field. Gating on the protocol minor
>   version alone would break existing filesystems: the minor version only
>   reflects the library, not whether the individual filesystem fills the
>   field, and a zero there would look like a generation change for any
>   filesystem that reports nonzero generations in LOOKUP.
> - Update `fuse_change_attributes` and related functions to accept and set
>   `inode->i_generation`.
> - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
>   responses.
> - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
>   `fuse_stale_inode()`, the same check already used by the `LOOKUP` and
>   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merging
>   the recycled file's attributes into the existing, possibly still-open,
>   inode.
> - Update `fuse_get_dentry` to validate the generation number against the
>   file handle, returning ESTALE on mismatch.
> - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
>   generation field in attr replies is ignored.
>
> Verification:
> Tested with a QEMU harness in fuse-generation-qemu against a patched
> libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) and
> its passthrough_ll example reporting real backing-filesystem generation
> numbers. The suite verifies that:
> 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
>     handles and matches the backing filesystem's FS_IOC_GETVERSION.
> 2.  `open_by_handle_at()` succeeds for a valid handle and fails with
>     ESTALE for a handle whose generation does not match, both while the
>     inode is cached and after cache eviction.

1 and 2 should work on upstream FUSE right?
This is something worth mentioning.

> 3.  When a `GETATTR` reply reports a new generation for a cached inode
>     (inode recycling), the kernel marks the inode bad: fstat() on an
>     open fd fails with EIO, while a fresh path lookup recovers and
>     pre-recycling file handles fail with ESTALE.

How did the inode recycle happen with passtrhough_ll which keeps
open fds for fuse inodes?
Something is missing from this test report.
If you just used a mock filesystem which makes no sense in the real world
then the value of this change is questionable.

>
> Signed-off-by: Russell Harmon <russ@har.mn>
> Assisted-by: Gemini:gemini-3.1
> ---
> v2:
> - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 changelog
>   entry (v1 added the entry but left the minor at 46).
>
> v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.mn/
>
>  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++++
>  fs/fuse/dir.c                           | 21 +++++++++++-----
>  fs/fuse/fuse_i.h                        | 10 ++++++--
>  fs/fuse/inode.c                         | 23 ++++++++++++------
>  fs/fuse/readdir.c                       |  2 +-
>  include/uapi/linux/fuse.h               | 11 +++++++--
>  6 files changed, 81 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/file=
systems/fuse/fuse.rst
> index 0fbd5a03fdc9..f67bc9fc6316 100644
> --- a/Documentation/filesystems/fuse/fuse.rst
> +++ b/Documentation/filesystems/fuse/fuse.rst
> @@ -49,6 +49,38 @@ using the sftp protocol.
>  The userspace library and utilities are available from the
>  `FUSE homepage: <https://github.com/libfuse/>`_
>
> +NFS export support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +FUSE filesystems can be exported via NFS if the filesystem daemon suppor=
ts it.
> +For reliable NFS export, the filesystem should provide a unique inode
> +generation number for each inode. This generation number is used by the
> +NFS server to distinguish between different file instances that may
> +share the same inode number (e.g. after an inode number is reused).
> +
> +The inode generation number is provided by the filesystem daemon in the
> +following messages:
> +
> +- `FUSE_LOOKUP`
> +- `FUSE_GETATTR` (see below)
> +- `FUSE_SETATTR` (see below)
> +- `FUSE_READDIRPLUS`
> +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FUSE_S=
YMLINK` / `FUSE_LINK`
> +
> +A daemon that keeps the generation number in its `FUSE_GETATTR` and
> +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
> +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` in
> +its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
> +compares the generation in every getattr/setattr reply against the
> +cached inode: a mismatch means the daemon has reused the node ID for a
> +different file, and the cached inode is marked bad (subsequent
> +operations on it fail with EIO). Without the flag, the field is ignored
> +and the generation is only taken from lookup-type replies, preserving
> +the behavior of existing filesystems.
> +
> +If the filesystem daemon does not provide a generation number, the kerne=
l
> +will use a default value of 0.
> +

On the one hand, I still need to understand the value of reporting generati=
on
in GETATTR/SETATTR.

On the other hand, I do see the value in the server negotiating at init tim=
e the
fact that "Generation values are reliable".

What happens today is that NFS exporting is allowed for all FUSE filesystem=
s
regardless of the reliability of generation id, so after inode evict
and recycle,
an NFSv3 client  that had access to inode X.Y may get access to a completel=
y
different file or even a directory with inode X.Y, where X is the recycle n=
odeid
and Y is an unreliable generation provided by the server.

The problem is that FUSE does not require opt-in for NFS export, it only
allows servers to opt-out of NFS export (FUSE_NO_EXPORT_SUPPORT).

So what can be done given a declaration of the server that generation
is reliable?

One option is to set a non-zero uuid/fsid to the fuse filesystem.
This will allow exporting the fuse filesystem without the opt-in uuid/fsid=
=3D
in /etc/exports.
This will also allow setting fanotify FAN_MARK_FILESYSTEM watches
on this fuse filesystem, whose file handles could be trusted to be a genuin=
e
unique identity of the filesystem objects.

But if we take this route, it is better to take it one step further
and allow the
server to determine the filesystem uuid/fsid during negotiation.

In any case, I am not convinced there is value in doing all this
without extending
the protocol with LOOKUP_HANDLE/LOOKUPX lookup by file handle, so if you
have compelling use cases, please spell them out.

Thanks,
Amir.
