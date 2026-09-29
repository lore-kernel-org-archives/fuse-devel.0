Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FEF526AB8;
	Tue, 29 Sep 2026 13:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687199; cv=none; b=r7tiaI0hvPQGCvtEYstOLOUiV/n2QcK2zc+HNbwAXz0uA4TvfAbZ/FvyTqIaCLGYQ7Ya+r+6TirWwdJbrEPVa8cthu31d+/ywljXkUFqLz2ZUrMSyo5cLpq9sOjYkFkrGbo1D9ukiK5DYunKNQX7fkTztpukglrt59b0ztCqat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687199; c=relaxed/simple;
	bh=HbiHSu1gZj2M8LqxK6m7VoynE0Pu4uWXZhWKhFZhqw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iezoeaC/+yg5BtnCqjsOmWvGWFsqwI2DSW48ClTnBF93Ul6QH/j1/VN9e5R6FmglbL8sW0DKAYSeUDpqms646hkTPRnWjsGi5HRXBATTxdd07AVuEG3eSfEXpabiUNIwn1XeXjhVuRgo/ZXps/Gt4n4crmFM30kotilUTRtpBro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=osEXGjCn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="osEXGjCn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:From:Reply-To;
	bh=wRSt/Q6yL3SDX46AhVe25U0RS95EF+oV/KiE0w+aORw=; b=osEXGjCn0/ckjUE2/hg7eBqEST
	8zqyyJUe5AY1bBn2Hj5VMj54znztgcnubR77+KJ06+YQfC5BksZVElPIvvNiNFr+KSqre02RoSz/8
	qUyHeYlcP99c4DuNxM7sFs1kCQ1HgGPHjQPkbJwIyNjka1EuPun5fmR3lDvjZFwI8U2IweRGxci0O
	6cPRxFMKxgQlhwsd2CZscfMLg/xc4CPEAknnZArSgF5KlOnHqE3iwEd4YI4vsmzEerJhTR8UvEnUm
	8SHZ7Ol2V39O+WSVf5lc5BcH8D21tH/aV/iIBGRFGXLB2whP58fUfkAdph34K8MbtwZi6soecVqak
	k4LOIfMA==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xBXXE-008vkJ-Tt; Tue, 29 Sep 2026 15:06:16 +0200
From: Luis Henriques <luis@igalia.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Russell Harmon <russ@har.mn>,  miklos@szeredi.hu,  corbet@lwn.net,
  skhan@linuxfoundation.org,  rdunlap@infradead.org,
  fuse-devel@lists.linux.dev,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Bernd Schubert <bernd@bsbernd.com>
Subject: Re: [PATCH v2] fuse: add inode generation number support
In-Reply-To: <CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
References: <20260927141437.1432584-1-russ@har.mn>
	<20260928014357.2285448-1-russ@har.mn>
	<CAOQ4uxiD9ofGEG+CkjszGaHygPWH7S4nob03XRNXUCrze5n91w@mail.gmail.com>
Date: Tue, 29 Sep 2026 14:07:17 +0100
Message-ID: <87tsn89pfe.fsf@igalia.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28 2026, Amir Goldstein wrote:

> On Mon, Sep 28, 2026 at 3:44=E2=80=AFAM Russell Harmon <russ@har.mn> wrot=
e:
>>
>> This patch adds support for propagating the inode generation number from
>> the FUSE server to the kernel.
>
> Incomplete statement.
> Without the mention of GETATTR/SETATTR this is a misleading statement.
>
>> This is useful for exporting FUSE
>> filesystems over NFS, where the generation number is used to detect
>> stale file handles (ESTALE) when inodes are recycled.
>
> How exactly does it help?
> I am not trying to troll you, I am really curious. how?
>
> Context: I have been trying to improve FUSE NFS export support for a while
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

I just want to add that this work is mostly stale at the moment.  It was
decided that it needs to be done on top of fusex, the next major protocol
version bump.  Also note that the initial draft of fusex lacked a bunch of
features (e.g., it was available for local-filesystems only), so it may
take a while before a LOOKUP_HANDLE operation is available.

Cheers,
--=20
Lu=C3=ADs

> [2] https://lore.kernel.org/linux-fsdevel/20260225112439.27276-1-luis@iga=
lia.com/
>
> So my question is, what does adding generation id to GETATTR/SETATTR
> improve for FUSE filesystem writers that wish to export their filesystem =
to NFS?
>
>>
>> Key changes:
>> - Bump FUSE protocol version to 7.47.
>> - Repurpose the unused `dummy` field in `struct fuse_attr_out` as
>>   `generation`.
>> - Add a `FUSE_ATTR_GENERATION` INIT flag with which the filesystem opts
>>   into the kernel consuming that field. Gating on the protocol minor
>>   version alone would break existing filesystems: the minor version only
>>   reflects the library, not whether the individual filesystem fills the
>>   field, and a zero there would look like a generation change for any
>>   filesystem that reports nonzero generations in LOOKUP.
>> - Update `fuse_change_attributes` and related functions to accept and set
>>   `inode->i_generation`.
>> - Populate `i_generation` from `LOOKUP`, `GETATTR`, and `READDIRPLUS`
>>   responses.
>> - Detect nodeid recycling on `GETATTR` and `SETATTR` responses via
>>   `fuse_stale_inode()`, the same check already used by the `LOOKUP` and
>>   `READDIRPLUS` paths, and mark the inode bad (EIO) instead of merging
>>   the recycled file's attributes into the existing, possibly still-open,
>>   inode.
>> - Update `fuse_get_dentry` to validate the generation number against the
>>   file handle, returning ESTALE on mismatch.
>> - Maintain backward compatibility: without `FUSE_ATTR_GENERATION` the
>>   generation field in attr replies is ignored.
>>
>> Verification:
>> Tested with a QEMU harness in fuse-generation-qemu against a patched
>> libfuse (FUSE_CAP_ATTR_GENERATION, fuse_reply_attr_with_generation) and
>> its passthrough_ll example reporting real backing-filesystem generation
>> numbers. The suite verifies that:
>> 1.  The generation from `LOOKUP` reaches `name_to_handle_at()` file
>>     handles and matches the backing filesystem's FS_IOC_GETVERSION.
>> 2.  `open_by_handle_at()` succeeds for a valid handle and fails with
>>     ESTALE for a handle whose generation does not match, both while the
>>     inode is cached and after cache eviction.
>
> 1 and 2 should work on upstream FUSE right?
> This is something worth mentioning.
>
>> 3.  When a `GETATTR` reply reports a new generation for a cached inode
>>     (inode recycling), the kernel marks the inode bad: fstat() on an
>>     open fd fails with EIO, while a fresh path lookup recovers and
>>     pre-recycling file handles fail with ESTALE.
>
> How did the inode recycle happen with passtrhough_ll which keeps
> open fds for fuse inodes?
> Something is missing from this test report.
> If you just used a mock filesystem which makes no sense in the real world
> then the value of this change is questionable.
>
>>
>> Signed-off-by: Russell Harmon <russ@har.mn>
>> Assisted-by: Gemini:gemini-3.1
>> ---
>> v2:
>> - Bump FUSE_KERNEL_MINOR_VERSION to 47 to match the new 7.47 changelog
>>   entry (v1 added the entry but left the minor at 46).
>>
>> v1: https://lore.kernel.org/all/20260927141437.1432584-1-russ@har.mn/
>>
>>  Documentation/filesystems/fuse/fuse.rst | 32 +++++++++++++++++++++++++
>>  fs/fuse/dir.c                           | 21 +++++++++++-----
>>  fs/fuse/fuse_i.h                        | 10 ++++++--
>>  fs/fuse/inode.c                         | 23 ++++++++++++------
>>  fs/fuse/readdir.c                       |  2 +-
>>  include/uapi/linux/fuse.h               | 11 +++++++--
>>  6 files changed, 81 insertions(+), 18 deletions(-)
>>
>> diff --git a/Documentation/filesystems/fuse/fuse.rst b/Documentation/fil=
esystems/fuse/fuse.rst
>> index 0fbd5a03fdc9..f67bc9fc6316 100644
>> --- a/Documentation/filesystems/fuse/fuse.rst
>> +++ b/Documentation/filesystems/fuse/fuse.rst
>> @@ -49,6 +49,38 @@ using the sftp protocol.
>>  The userspace library and utilities are available from the
>>  `FUSE homepage: <https://github.com/libfuse/>`_
>>
>> +NFS export support
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +FUSE filesystems can be exported via NFS if the filesystem daemon suppo=
rts it.
>> +For reliable NFS export, the filesystem should provide a unique inode
>> +generation number for each inode. This generation number is used by the
>> +NFS server to distinguish between different file instances that may
>> +share the same inode number (e.g. after an inode number is reused).
>> +
>> +The inode generation number is provided by the filesystem daemon in the
>> +following messages:
>> +
>> +- `FUSE_LOOKUP`
>> +- `FUSE_GETATTR` (see below)
>> +- `FUSE_SETATTR` (see below)
>> +- `FUSE_READDIRPLUS`
>> +- `FUSE_CREATE` / `FUSE_TMPFILE` / `FUSE_MKNOD` / `FUSE_MKDIR` / `FUSE_=
SYMLINK` / `FUSE_LINK`
>> +
>> +A daemon that keeps the generation number in its `FUSE_GETATTR` and
>> +`FUSE_SETATTR` replies (the `generation` field of `fuse_attr_out`,
>> +protocol 7.46) must announce this by setting `FUSE_ATTR_GENERATION` in
>> +its `FUSE_INIT` reply flags. When the flag is negotiated, the kernel
>> +compares the generation in every getattr/setattr reply against the
>> +cached inode: a mismatch means the daemon has reused the node ID for a
>> +different file, and the cached inode is marked bad (subsequent
>> +operations on it fail with EIO). Without the flag, the field is ignored
>> +and the generation is only taken from lookup-type replies, preserving
>> +the behavior of existing filesystems.
>> +
>> +If the filesystem daemon does not provide a generation number, the kern=
el
>> +will use a default value of 0.
>> +
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
>
> Thanks,
> Amir.

