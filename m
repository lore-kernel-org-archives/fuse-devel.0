Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794925910;
	b=Ab5je+IZmp8fhhN0Lc+HWjL3GnMo8JZ2+eGAMsmpiHozjMclxN8YuivxL78kHkqS1OmC
	 tBqntC34lLdXpaOvZPakAYl+QJUVFha6Cp5UgdOychGLY52E/BU9Qc3PVD2ECmI8uh1wM
	 e23SBMt1GpbromHx/hP++2PO0yjD/qZUFvEyXW6ao/tVr8O/4VvYWpiGqPRugSkWa+64g
	 wZweHi7rV08sMeoNQLQthLi9wfFXfb75+f15LxxniE9gGlaVPlBuek6Fv1JZZUVtVt3P7
	 gVORT9MkVX0jrAYuT1mm4IEVZiXxf67ZDia8ZbmSUuAzH7YP/OOVU1pM5y6QITO4rCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:In-Reply-To:References:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
	b=zAKLOXxqk9JxAXvzs/rJyQU9IWD+6GSFTu7kjszSKfkHWJTAIQk5V4oCiDEr0aukRYNx
	 Rc+YX/3pK/fqjIMCqmYmAbQdN/CAEczAOI6VG/sX7Ngk1L1Y1nJpTGJblJ9yp47sijHWi
	 RS9BJIhKiysNmnAX+DNxDB9Ov7NBex9TmOtZF3b7k2idFnoc7bUWTCrgo214Gv3yGlD24
	 7de8bsXvlPXPWF5DACnw8IgpM/3++eA/xieyVJi7nXyTZtW7iQrftEHON/HMCN1GAM5vC
	 /NxzYfmV/yPa05ESbOmTIAFinBXfnv0wXumT27943CWFy1CsBdkXVKl9u2HDnQ1LBNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAibK1G8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88C0606A323
	for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 14:31:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C88C0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KAibK1G8
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53644b28706so44337681cf.3
        for <fuse-devel@lists.linux.dev>; Tue, 17 Nov 2026 06:31:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794925909; cv=none;
        d=google.com; s=arc-20260327;
        b=qFSu2W7BQqddl6SMUs1GqdVStauRA11AMIlFbFu5kXOTomia4ajziSfyGefOM1rdy5
         KZuNjTOhcF9zzWeirxHMr4PYu+NyUH3wuwHjyWEI0IfmnIkSaiGYvGrPnHllh42DtdkB
         augEWKF6P+V4Ctjn/vgLigGpb/FO2iDXS6HM81I1nFkpdOGG1+qNgDFtK0BRemHffJFx
         74gl1isEFsib7r7rawVRle3iZyQvd4nRQRQqqykJlP1tm+YlWujGo3j4QIyLrBAhweDb
         kfi6VTjTtItvhZKT7atrekzeqw114ommAvZn8X6x8nEPNU0DE5fkDa7OYBKANFASIgOR
         Vv4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
        fh=UwhcgLdmTEeoL9hJN2M0Uy4YN4fQZt60SrJ+X1+bvjw=;
        b=swxyqZAuWwEdjAcksHfJ9d6W9eX8xJwvl4JWoqAQ5rwq9ts1wBvrNGmOA6ZSi4jraf
         Zf0PH++p9na9Yf4NxqpNB0r3IuVWsrBFcgBeo31BAd9+yQzNPtVyIeWMp4NNQBXfvbNv
         GBlO381ATqMO4yxhGapo4jCnj/ahFhYAoVetV21PwS71QvVg2sA2QBAqjjs+w+1ZKmIi
         qutdGlrBNvCmzEl3LfO+hmnjy24ws7xxtBgQ70pBQt/McOYzLmlrbCu0NcGixT9ewV2J
         AcQp9UQMvy/AVHaMSrXU3DeH5rl461j8cV+a6IQ0DK9Qzib9QIEwxFUu78j2azPPlTkG
         jm0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925909; x=1795530709; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
        b=KAibK1G85QMsZ6tL4xv9wxMmTvQlT4H+D7S214JM8zUZlmIsQjb3qlpf6r1Pgdx11C
         BLx09tNyzQonXWO0AvixF+rx8s9yCniDmNjVpjVLNkJbu1vTDVn7FpV7Kg/Af6y4lAHS
         CbSZytJt2k2fwCEtVOwdAxTpJr/AgYgOhNVs8bSwo7o/9wCoOJ3mvqDPxaeCN0CEKfl9
         f00ulurif1PgLPXY7p6Wndo2JMMBC1vR4ab7vq8+PzPAmiANqqgrsIVOlMpdVWpdElDa
         siViWYojbVFVosLkhUTgL6SkJxWde98uMxPIf+nm8xYWQvCFAF1GVgELWCpkE9FexkzC
         hf4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925909; x=1795530709;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TszkTcdWcLDyL+0JxTi5b09ZBrAAFon+oeNujwIlDTg=;
        b=V0ZHPV81MDsnf0Q5oy8afeMuqrT7Z/Y80f/RfEqnbvZPH8my+eA9BLypIYnO5ZKDPA
         kxfM3s4059AndFjIwUA4ncyCsFTu1lx35mGpsCNtmHnbSfAOeuuGOelPwG4HqBekVRjf
         3otRxGSVhIapL2fLR39NmoUVuPo7yKh3Ac4cngg0WVO+2HOnQgLk9GzF8khfqIruq0c0
         o+TjodDyHdNmEahftRDC89PEu/SJBeb7cDuvgj50CQefmyQACF5JE++ZcbQD+Y4uOy0t
         Tpzm+ipRBmK0QLAC3ZClkkfGiwtuWYIYGMouN+3OhIkjIeVspstbE66Wvus9ydz04g9e
         rknw==
X-Forwarded-Encrypted: i=1; AL+hErFm/ly+ucT9iU//TJ+J2xE2YZWFe4gPpsYYDXF6s2XzFOd+n1qoiTXr290FFM5/lcp4n1/r4fxn90cW@lists.linux.dev
X-Gm-Message-State: APuU4Z8nfwN2jLP9gtL4YsPyDe9eNsonzKlkE9px+slzOsb0AsryWzMd
	77qWfsmjb7+VV/hmCY1XKQGd0TAJTnhxTEarfGXjyFpgVOce9FjZbBTDJNGDgJnU0x4WlrFfaC/
	yt7UUhiG6FFfJeXvefGhswHo2NqS5HCQ=
X-Gm-Gg: AYBFou3my7qnQxykcRedrnsSd0vGll7sAnwNf+BOfLmc4uOffphYbkRoF3+V/8J282S
	9afal0ujyb+45SYW8MLxgEKuNfrmF8+6t8pj0g59i0zWjFh6+Tutywzhyp2h1KI+yHsiA5T78RZ
	h0IhJYGry5X0qIztN6lC0QH/EFqzSGdrAVJS1wNCrB+CdebweCY7Yvv4kum7FbEHhcqN5jkBFhE
	SHu6GHipwa518F+6N2Q8fm+7sNsdWJsk9sDHzwq/zyn+eAOC0yL5Kyk8CrFecAu+Bpy2B2oI1SE
	m7/NwbMXn1Cqg+XZYp2KmtI3WsxyhpIpFpb4rSJCXhfUtCaQhfRc/44uPTzLcHMpCio19F238d1
	pQE7Oo3So3RkLLIJaJNJqSqW+/OzPqKtM254=
X-Received: by 2002:a05:622a:304:b0:533:2717:6221 with SMTP id
 d75a77b69052e-55ac765f6bfmr222851271cf.31.1794925908476; Tue, 17 Nov 2026
 06:31:48 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 17 Nov 2026 08:31:47 -0600
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Hristos Nenkov <nenkov2004@gmail.com>
In-Reply-To: <20261117-tanzpaar-dreihundert-attentat-6f03576b56c9@brauner>
References: <CAO7_G+ypR12OwOiwnrqXDAC9zoboTMn_qLoASfJqYP3H83Vk5A@mail.gmail.com>
 <20261117-tanzpaar-dreihundert-attentat-6f03576b56c9@brauner>
Date: Tue, 17 Nov 2026 08:31:47 -0600
X-Gm-Features: AclHuK_WIFhNkCr5GXrVFJRrFg2_b-Bo8eosWpjZkIoWkPjU6KqPeknhrXUxKYs
Message-ID: <CAO7_G+xaooz=gYyO5kw3Qbz+1MF=TUD-XQpAy33ETSX2xBVQ-w@mail.gmail.com>
Subject: [PATCH v2] fuse: preserve daemon-owned ACL permission decisions
To: Christian Brauner <brauner@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Seth Forshee <sforshee@kernel.org>, Lakshita Jain <lakshita.jain@databricks.com>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

FUSE daemons without default_permissions historically handled POSIX ACL
ownership decisions themselves. The generic ACL owner check prevents
non-owner ACL changes from reaching these daemons.

Add IOP_SET_ACL_OWNER_CHECK so a filesystem can perform the owner check
in ->set_acl(). Set it on FUSE inodes and check ownership in fuse_set_acl()
when default_permissions is enabled. FUSE_POSIX_ACL also enables
default_permissions, so it needs no separate check.

Other filesystems retain the generic ownership check.

Reported-by: Lakshita Jain <lakshita.jain@databricks.com>
Link: https://lore.kernel.org/all/CALE1rk6tGt_Pe7CpFL1NSTgugVpXLH_iguO2D9VsAVHn1p-02w@mail.gmail.com/
Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Hristos Nenkov <nenkov2004@gmail.com>
---
Changes since the RFC:
- Use IOP_SET_ACL_OWNER_CHECK and only test default_permissions.
- Drop the caller restriction and channel-readiness changes.
- Follow Christian's proposed four-file diff.

Hi Christian,

Thanks for the review. This follows your proposed diff, with the owner
check in fuse_set_acl() and no caller or channel-readiness additions.

I built this revision on f66469d9905b39d2c260a15d7d6db450f4db67c1
with a minimal x86_64 configuration. QEMU TCG runs completed 88
assertions on the baseline and 88 on v2, with no mismatches against
the respective expected behavior. The legacy non-owner ACL operations
are blocked on the baseline and reach the daemon with v2.

The tests cover ACL set/removal, owner/non-owner callers, all three
permission modes, daemon denial, malformed ACLs, read-only mounts,
and tmpfs owner/non-owner controls. Checkpatch --strict is clean.
These are targeted in-memory daemon tests; I have not rerun Lakshita's
exact passthrough application reproducer or the full kernel suite.

This revision was prepared with AI assistance; no Tested-by or
Reviewed-by trailer is claimed.

Thanks,
Hristos

diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
--- a/fs/fuse/acl.c
+++ b/fs/fuse/acl.c
@@ -98,6 +98,15 @@
 	const char *name;
 	int ret;

+	/*
+	 * Without default_permissions the server does all permission
+	 * checking, including who may change POSIX ACLs. That's the same
+	 * thing fuse_do_setattr() does for chmod() and chown() by passing
+	 * ATTR_FORCE.
+	 */
+	if (fc->default_permissions && !inode_owner_or_capable(idmap, inode))
+		return -EPERM;
+
 	if (fuse_is_bad(inode))
 		return -EIO;

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -439,6 +439,12 @@
 	 */
 	if (!fc->posix_acl)
 		inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
+	/*
+	 * Whether the kernel or the server decides who may change POSIX ACLs
+	 * depends on default_permissions which FUSE_POSIX_ACL turns on during
+	 * FUSE_INIT. So fuse_set_acl() does the owner check, not the vfs.
+	 */
+	inode->i_opflags |= IOP_SET_ACL_OWNER_CHECK;
 }

 static int fuse_inode_eq(struct inode *inode, void *_nodeidp)
diff --git a/fs/posix_acl.c b/fs/posix_acl.c
--- a/fs/posix_acl.c
+++ b/fs/posix_acl.c
@@ -949,7 +949,8 @@

 	if (type == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
 		return acl ? -EACCES : 0;
-	if (!inode_owner_or_capable(idmap, inode))
+	if (!(inode->i_opflags & IOP_SET_ACL_OWNER_CHECK) &&
+	    !inode_owner_or_capable(idmap, inode))
 		return -EPERM;

 	if (acl) {
diff --git a/include/linux/fs.h b/include/linux/fs.h
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -627,6 +627,8 @@
 #define IOP_CACHED_LINK		0x0040
 #define IOP_FASTPERM_MAY_EXEC	0x0080
 #define IOP_FLCTX		0x0100
+/* ->set_acl() does the owner check itself */
+#define IOP_SET_ACL_OWNER_CHECK	0x0200

 /*
  * Inode state bits.  Protected by inode->i_lock


On Tue, 17 Nov 2026 15:00:51 +0100, Christian Brauner
<brauner@kernel.org> wrote:
> On Fri, Nov 13, 2026 at 11:03:15AM +0100, Hristos Nenkov wrote:
> > Introduce an opt-in inode-operation flag so FUSE can make the ownership
> > decision in its ACL callback. Retain owner/capability checking for
> > default_permissions and negotiated POSIX ACL mode, and leave the generic
> > ownership check in place for filesystems that do not opt in.
>
> The flag is fine. The rest isn't needed.
>
> > Enforce the FUSE mount caller restriction and wait for channel readiness
> > before reading negotiated policy, including requests on the mount root.
>
> Neither of these. Before v6.2 posix acls on a fuse server without
> FUSE_POSIX_ACL were plain system.* xattrs. xattr_permission() let them
> through without an owner check and fuse_allow_current_process() was
> never called for them.
>
> The handlers were only switched to the acl handlers in
> process_init_reply() so a write before FUSE_INIT took the unchecked
> path. That's exactly what happens with the change below and
> fuse_do_setattr() reads fc->default_permissions before FUSE_INIT the
> same way. If that window is a problem it's a problem for all of fuse and
> not something to paper over in the acl path.
>
> And fc->posix_acl is only ever set together with
> fc->default_permissions so checking default_permissions is enough.
>
> I kinda hate that we have to use an iop flag.
>
> Please send a v2 that does just this. It survives Lakshita's
> reproducer:
>
> diff --git a/fs/fuse/acl.c b/fs/fuse/acl.c
> index 738abed9a8166..56cdafabfb399 100644
> --- a/fs/fuse/acl.c
> +++ b/fs/fuse/acl.c
> @@ -98,6 +98,15 @@ int fuse_set_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
>  	const char *name;
>  	int ret;
>
> +	/*
> +	 * Without default_permissions the server does all permission
> +	 * checking, including who may change POSIX ACLs. That's the same
> +	 * thing fuse_do_setattr() does for chmod() and chown() by passing
> +	 * ATTR_FORCE.
> +	 */
> +	if (fc->default_permissions && !inode_owner_or_capable(idmap, inode))
> +		return -EPERM;
> +
>  	if (fuse_is_bad(inode))
>  		return -EIO;
>
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index 1341b681d0ed3..d7070f58d7ec7 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -439,6 +439,12 @@ static void fuse_init_inode(struct inode *inode, struct fuse_attr *attr,
>  	 */
>  	if (!fc->posix_acl)
>  		inode->i_acl = inode->i_default_acl = ACL_DONT_CACHE;
> +	/*
> +	 * Whether the kernel or the server decides who may change POSIX ACLs
> +	 * depends on default_permissions which FUSE_POSIX_ACL turns on during
> +	 * FUSE_INIT. So fuse_set_acl() does the owner check, not the vfs.
> +	 */
> +	inode->i_opflags |= IOP_SET_ACL_OWNER_CHECK;
>  }
>
>  static int fuse_inode_eq(struct inode *inode, void *_nodeidp)
> diff --git a/fs/posix_acl.c b/fs/posix_acl.c
> index fe77934ea8f20..9256607e897da 100644
> --- a/fs/posix_acl.c
> +++ b/fs/posix_acl.c
> @@ -949,7 +949,8 @@ set_posix_acl(const struct mnt_idmap *idmap, struct dentry *dentry,
>
>  	if (type == ACL_TYPE_DEFAULT && !S_ISDIR(inode->i_mode))
>  		return acl ? -EACCES : 0;
> -	if (!inode_owner_or_capable(idmap, inode))
> +	if (!(inode->i_opflags & IOP_SET_ACL_OWNER_CHECK) &&
> +	    !inode_owner_or_capable(idmap, inode))
>  		return -EPERM;
>
>  	if (acl) {
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 5b3a100aba77b..016eeea5da5bf 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -628,6 +628,8 @@ is_uncached_acl(struct posix_acl *acl)
>  #define IOP_CACHED_LINK		0x0040
>  #define IOP_FASTPERM_MAY_EXEC	0x0080
>  #define IOP_FLCTX		0x0100
> +/* ->set_acl() does the owner check itself */
> +#define IOP_SET_ACL_OWNER_CHECK	0x0200
>
>  /*
>   * Inode state bits.  Protected by inode->i_lock
>
> --
