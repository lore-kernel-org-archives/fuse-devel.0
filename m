Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793178774;
	b=AcAzJj3efFUTMHrDzs4wzLze6/1uyeYYmQLllOA0ffrS9tDrjRpQydL1vrR+zuRoq5Ii
	 A+rwv9gq+WlbehjOiGdESpI5PcMQuRpBTlJdpKetsU+DqEgmHgFyxxQaDMhsIaRSytr4+
	 S/WoaTpYItEHbaW9FUXP60KQ83ONvNNMKZV26pk1AL/HvfRa5irZ030ydYXVn7lcVzH0R
	 HQKQGntxtKdJ1UUy1p7ynKeollUcdCqsBEFZvOkZuj763fDOlV7X2uzqVtXu4IyTczKLL
	 zTVaQe9eolXXy2U0dctSXYAaxCqhqmd6Tr0Y0ljU0Jy2n8BUJlkT7t2GSPgV9S1AP5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793178774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dlb9as4cJiQPVORl9Dp4rDzc8ExdgDSFJHhG7PkV/gY=;
	b=I3Qs68BUkxUGHmgWachuk/WIlssPc3lgNbl30eoaBFp4nUSOsHaGWbNUoMzGFMUDrz/c
	 0h/mkrYDuu1YAElsgIWTzXoNNgOUSOU8V8bDrsVdBg2Na1h6vKJT2QhHAhV/YKR3/OUXf
	 jzxOGpwp2RA1Vyw8dk+IJAd7eNOjdN2bPw5DCyMqimBOatMUVMJ+LrWrUuO3ruNtxYIbx
	 I+4Ykrq7CSHKQFT7MUPTUuSrvdNwt7Z8DomdAEN1h9cmcvNVOF63NK+ElvxMWoHDZ7ryY
	 lQO4gHvU0YMqpMKEX8szE0LRdpx8RnGKeFkBYdh/KLo8zj08wTwWzQwaBY8Xyfhh/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aud2dMsm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A443606A31A
	for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 09:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A443606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aud2dMsm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so6492625e9.2
        for <fuse-devel@lists.linux.dev>; Wed, 28 Oct 2026 02:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793178773; x=1793783573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dlb9as4cJiQPVORl9Dp4rDzc8ExdgDSFJHhG7PkV/gY=;
        b=aud2dMsmQu1sy9zPLWdjLXvRcMSwKZ+tPwNk6UcTVUK8rjoLZ7UVqD/NarZXatxR1C
         fQ9RmRbjMRe0ok5651Bqp3+NzuyasFP3Ulo452VJZTuXt0ZvmMqilaYTzau8dxckvdd8
         S8PQPUoVfxya7szBbk0xFcI8MTFbYrokbFyRVnZVJX08KtQFDLxOWZp24CSMw4x0BkkM
         dQ7yLHMTuLiBgi9Lj4Kmj30lZcpEOp2n/p+WHw08xUvdzjadt3BklRsx4thPdA6IGT8t
         45C41jBupkSD0EntSlL2Yv3WMB1cFYEoG+x+vMqa/9nHarVWpCmpghrHTzj6PljTwAsW
         rUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793178773; x=1793783573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dlb9as4cJiQPVORl9Dp4rDzc8ExdgDSFJHhG7PkV/gY=;
        b=z4BBAb0sHClip+qIkxe7Yls6O6KozB2EkKnBKN0QTmv5MSR5Vj0taUONTACpvGjrro
         IGZlsn2KMFPfhCo+qsRu1KPPhbFT6v+/ZP6PiNESRmGT0Ntbffmr+lZl+qkeHloYrhuq
         0esa4Y2rbCLVCfsqWmFeQfpiwOjG17k5rCXvzEDZacIGCNMiz1x2kFCacwAXt76UyqB5
         2c4lV581ZcmDLtTAOMDqonQH6o0nL18FqynsMi6zWLsD0wva8LOO/YKuy+FRvrOzz1Aj
         ZY9y4jv3O8jTosrhftDVJ7JnDGLvykQpx2SiuEnbt9wAtAo2XGYHlhWldQ7OsuTdhLwM
         uZrQ==
X-Gm-Message-State: AFq9FYJ6huBJJ+4KqHqCzCXg7PSsFJC2Fr0EQ9i4NivR8iratqd7S6od
	3fl59jCMt3w/uFSAcxtHCdDnIQmSXZBHG+TtFmIrimlcRxmw6pIss2+q
X-Gm-Gg: AYBFou0t7u90hJ5gV+VjXtPEsiP31hsnUXaZire11G9N13zXy67KZ+35SRWx5w30Ze6
	Bnc4EZ/foDWT63tx09dkkB++D7SqMqr/sOySMtjhU2tNFIGL8T6V0gIHQ5fXwk+6dyTrFQiAis4
	WiJWhqbe3oX5Yf6olzLcXJc2+ZlDaautDDZrDbg3kavMMp0N/8sW0hs9hqgqZhMig9cr1Vilv+Y
	3KnnUFPK3gTHeCy7cN9lVfIs6CB+sOYw+i4hzcb/KaP/t58SjAapN1kz37UBOzocdKFBUc1IuaJ
	QQbxubq64doWkOHYWgolwA4Vx4hCL9NiCT8u7FRAirVGCmkJOp41VoiILfXi93FjqKZuxVCTEU1
	gVux0mgmtH01Fd9LoxSmoc2DGjMlFQLMVazw42Jnu4wl4HDiSMy8R6wP40/KDv24p1r+BC9jQ53
	PLbCIY5hkoBDjjIpDZ5xVDxC9fO5j2r9VD/lhoGnD9MXQhLg/7+iEMN/ZqVVP5i8V3zEtSKuF4r
	bDU9dqAIMb8vz76FCuiWblOb7MQdKRaZIsY68WLbg0biPjbkzbj++KjYSbCosn4oQgFNnu+3V3x
	f56WvLsS40urazSVNzFWdDDPfyZXySkQ1HP4hRJD2djHbjBbMcA4D/V3hCLUzBY=
X-Received: by 2002:a05:600c:354a:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4a9662a0c02mr32169255e9.9.1793178772465;
        Wed, 28 Oct 2026 02:12:52 -0700 (PDT)
Received: from t480.fritz.box ([2001:a61:3a4e:c601:fc75:724e:6b78:3649])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c42b3c1sm33507215e9.6.2026.10.28.02.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:12:51 -0700 (PDT)
From: Han-Wen Nienhuys <hanwenn@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	Han-Wen Nienhuys <hanwenn@gmail.com>
Subject: [PATCH 7/7] fuse: let the server ask for a directory to be read in the background
Date: Wed, 28 Oct 2026 10:12:15 +0100
Message-ID: <20261028091215.914885-8-hanwenn@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028091215.914885-1-hanwenn@gmail.com>
References: <20261028091215.914885-1-hanwenn@gmail.com>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The name filter is only built when something lists the directory, but
many probes come from programs that never do, such as compilers
searching include paths. Add FUSE_NOTIFY_READDIRPLUS, with which the
server asks the kernel for a complete READDIRPLUS pass of a directory,
as if it was opened with FOPEN_COMPLETE_DIR.

Having the kernel do the reads keeps lookup counts and race detection
as for any READDIRPLUS pass; pushing the listing in a notification
would need new rules for both. The cost is the round trips of OPENDIR,
READDIRPLUS and RELEASEDIR.

The natural trigger is a negative LOOKUP reply. The server cannot tell
a false positive of the filter from a lookup in an unlisted directory,
so the hint fails with EALREADY if the directory has a valid filter or
a pass is running. The server can then send it after every negative
LOOKUP without keeping state. The directory is read after the
notification returns, which does not wait for the server, so the hint
can be sent from the LOOKUP handler itself.

The pass is a work item that sends its requests synchronously. Each
READDIRPLUS and the processing of its reply run under the shared
directory lock, and are skipped for a removed directory, as
iterate_dir() does for getdents. The lock is not held in between; the
names generation catches modifications there. The work items run on a
workqueue per connection, allocated on first use, so that a server that
does not reply only holds up its own passes. As each pass holds a
dentry and a reply buffer, a connection runs at most 8 passes, which is
also the max_active of the workqueue. Further hints fail with EBUSY.

The readdir cache is not filled, as it assumes reads through a file,
nor reset for a server that returns no FOPEN_KEEP_CACHE on OPENDIR.

The requests are made on behalf of no process: OPENDIR and READDIRPLUS
carry FUSE_INVALID_UIDGID, as on idmapped mounts. The kworker's
credentials would make them root, or fail to map in a user namespace,
and the notifier's may not map either if the device fd was passed
across namespaces, failing the requests silently, so they are sent
with args->no_caller. As there is no struct file, the pass is not seen
by LSM file hooks or fsnotify; its dentries still go through
d_splice_alias() and security_d_instantiate(). The work runs under the
memcg of the server that sent the hint, so that the entries it
instantiates are charged as they would be to a reader. As for
getdents(), the reply buffers are not charged.

The dentry is pinned when the hint arrives, so a hint for an inode
without a dentry fails with ENOENT. Unmount waits for the mount's
passes: before FUSE_DESTROY if one is sent, as no request may follow
it, and otherwise after aborting the connection. A pass releases the
directory synchronously for the same reason. Passes are only queued
under fc->killsb while the mount is on the connection.

As for the other notifications, support is indicated by the minor
version.

Signed-off-by: Han-Wen Nienhuys <hanwenn@gmail.com>
Assisted-by: Claude:claude-opus-5-5
---
 fs/fuse/dir_names.c       |  14 +++
 fs/fuse/fuse_i.h          |  17 +++
 fs/fuse/inode.c           |  11 +-
 fs/fuse/notify.c          |  23 ++++
 fs/fuse/readdir.c         | 253 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/virtio_fs.c       |   1 +
 include/uapi/linux/fuse.h |  29 +++++
 7 files changed, 347 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir_names.c b/fs/fuse/dir_names.c
index b9b25e25baf8..3e0d730aecac 100644
--- a/fs/fuse/dir_names.c
+++ b/fs/fuse/dir_names.c
@@ -227,6 +227,20 @@ static void fuse_dir_names_drop_stale(struct fuse_inode *fi,
 		kvfree_rcu(names, rcu);
 }
 
+/* Does @dir have a filter that can answer lookups? */
+bool fuse_dir_names_valid(struct inode *dir)
+{
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	bool valid;
+
+	rcu_read_lock();
+	valid = fuse_dir_names_current(get_fuse_conn(dir),
+				       rcu_dereference(fi->rdc.names));
+	rcu_read_unlock();
+
+	return valid;
+}
+
 /*
  * Is @name known not to exist in @dir?  If so, return the time until which
  * this is valid in @expires.
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 8e1117d45276..9763d56399f6 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -298,6 +298,8 @@ enum {
 	 * or the fuse server has an exclusive "lease" on distributed fs
 	 */
 	FUSE_I_EXCLUSIVE,
+	/* A background READDIRPLUS pass is queued or running */
+	FUSE_I_READDIRPLUS_HINT,
 };
 
 struct fuse_conn;
@@ -671,6 +673,12 @@ struct fuse_conn {
 	/** @names_key: Key for hashing names in directory name filters */
 	siphash_key_t names_key;
 
+	/** @num_readdir_hints: background READDIRPLUS passes queued or running */
+	atomic_t num_readdir_hints;
+
+	/** @readdir_wq: Workqueue of the passes, allocated on first use */
+	struct workqueue_struct *readdir_wq;
+
 	/**
 	 * @async_dio: Does the filesystem support asynchronous direct-IO
 	 * submission?
@@ -847,6 +855,12 @@ struct fuse_mount {
 
 	/* Entry on fc->mounts */
 	struct list_head fc_entry;
+
+	/* Background READDIRPLUS passes queued or running */
+	atomic_t num_readdir_hints;
+	/* Set at unmount, to end the passes early */
+	bool readdir_hints_stop;
+
 	struct rcu_head rcu;
 };
 
@@ -1280,6 +1294,8 @@ int fuse_set_acl(struct mnt_idmap *, struct dentry *dentry,
 /* readdir.c */
 int fuse_readdir(struct file *file, struct dir_context *ctx);
 void fuse_readdir_names_release(struct fuse_file *ff);
+int fuse_readdir_hint(struct fuse_conn *fc, u64 nodeid);
+void fuse_readdir_hint_drain(struct fuse_mount *fm);
 
 /* dir_names.c */
 
@@ -1299,6 +1315,7 @@ void fuse_dir_names_changed(struct inode *dir);
 void fuse_dir_names_add(struct inode *dir, const struct qstr *name);
 void fuse_dir_names_invalidate(struct inode *dir);
 void fuse_dir_names_free(struct inode *dir);
+bool fuse_dir_names_valid(struct inode *dir);
 bool fuse_dir_names_absent(struct inode *dir, const struct qstr *name,
 			   u64 *expires);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 5647089eaa5a..5c3aa70dc12a 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1033,6 +1033,8 @@ void fuse_conn_put(struct fuse_conn *fc)
 	if (IS_ENABLED(CONFIG_FUSE_VDAX))
 		fuse_vdax_conn_free(fc);
 	cancel_work_sync(&fc->epoch_work);
+	if (fc->readdir_wq)
+		destroy_workqueue(fc->readdir_wq);
 	fuse_chan_release(fc->chan);
 	put_pid_ns(fc->pid_ns);
 	bucket = rcu_dereference_protected(fc->curr_bucket, 1);
@@ -2009,8 +2011,14 @@ void fuse_conn_destroy(struct fuse_mount *fm)
 {
 	struct fuse_conn *fc = fm->fc;
 
-	if (fc->destroy)
+	if (fc->destroy) {
+		/*
+		 * No request may follow FUSE_DESTROY.  It waits for the server
+		 * anyway, so the passes can be waited for first.
+		 */
+		fuse_readdir_hint_drain(fm);
 		fuse_send_destroy(fm);
+	}
 
 	fuse_chan_abort(fc->chan, false);
 	fuse_chan_wait_aborted(fc->chan);
@@ -2033,6 +2041,7 @@ static void fuse_sb_destroy(struct super_block *sb)
 		last = fuse_mount_remove(fm);
 		if (last)
 			fuse_conn_destroy(fm);
+		fuse_readdir_hint_drain(fm);
 	}
 }
 
diff --git a/fs/fuse/notify.c b/fs/fuse/notify.c
index 984e4945e3e3..784915926322 100644
--- a/fs/fuse/notify.c
+++ b/fs/fuse/notify.c
@@ -478,6 +478,26 @@ static int fuse_notify_map(struct fuse_conn *fc, unsigned int size,
 	return fuse_ext_map_populate(fc, &outarg, ext);
 }
 
+static int fuse_notify_readdirplus(struct fuse_conn *fc, unsigned int size,
+				   struct fuse_copy_state *cs)
+{
+	struct fuse_notify_readdirplus_out outarg;
+	int err;
+
+	if (size != sizeof(outarg))
+		return -EINVAL;
+
+	err = fuse_copy_one(cs, &outarg, sizeof(outarg));
+	if (err)
+		return err;
+	fuse_copy_finish(cs);
+
+	if (outarg.flags || outarg.padding)
+		return -EINVAL;
+
+	return fuse_readdir_hint(fc, outarg.nodeid);
+}
+
 int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 		unsigned int size, struct fuse_copy_state *cs)
 {
@@ -515,6 +535,9 @@ int fuse_notify(struct fuse_conn *fc, enum fuse_notify_code code,
 	case FUSE_NOTIFY_BACKING_MAP:
 		return fuse_notify_map(fc, size, cs);
 
+	case FUSE_NOTIFY_READDIRPLUS:
+		return fuse_notify_readdirplus(fc, size, cs);
+
 	default:
 		return -EINVAL;
 	}
diff --git a/fs/fuse/readdir.c b/fs/fuse/readdir.c
index af3446aa30f5..736d2147f04a 100644
--- a/fs/fuse/readdir.c
+++ b/fs/fuse/readdir.c
@@ -12,6 +12,8 @@
 #include <linux/highmem.h>
 #include <linux/vmalloc.h>
 #include <linux/namei.h>
+#include <linux/memcontrol.h>
+#include <linux/sched/mm.h>
 
 /*
  * Names of a listing that is being read with FOPEN_COMPLETE_DIR.  The number of
@@ -669,6 +671,257 @@ static int fuse_readdir_uncached(struct file *file, struct dir_context *ctx)
 				     &eof);
 }
 
+#define FUSE_READDIR_HINT_FLAGS (O_RDONLY | O_DIRECTORY)
+
+/* Passes per connection, each of which holds a worker while it waits */
+#define FUSE_READDIR_HINT_MAX 8
+
+/* A pass requested by the server */
+struct fuse_readdir_hint {
+	struct work_struct work;
+	struct dentry *dentry;
+	/* of the server, which is charged for the pass as a reader would be */
+	struct mem_cgroup *memcg;
+};
+
+static bool fuse_readdir_hint_actor(struct dir_context *ctx, const char *name,
+				    int namelen, loff_t off, u64 ino,
+				    unsigned int type)
+{
+	return true;
+}
+
+static bool fuse_readdir_hint_stopped(struct fuse_mount *fm)
+{
+	return READ_ONCE(fm->readdir_hints_stop);
+}
+
+static struct fuse_file *fuse_readdir_hint_open(struct fuse_mount *fm,
+						struct inode *dir)
+{
+	struct fuse_file *ff;
+
+	if (fuse_readdir_hint_stopped(fm))
+		return ERR_PTR(-ENOTCONN);
+
+	ff = __fuse_file_open(fm, get_node_id(dir), FUSE_READDIR_HINT_FLAGS,
+			      true, true);
+	if (IS_ERR(ff))
+		return ff;
+
+	/* The readdir cache is only filled by reads through a file */
+	ff->open_flags &= ~FOPEN_CACHE_DIR;
+	return ff;
+}
+
+/*
+ * Read the directory with READDIRPLUS until the end, or until the listing
+ * cannot be completed, eg. if it is too big.
+ */
+static void fuse_readdir_hint_read(struct fuse_mount *fm, struct fuse_file *ff,
+				   struct dentry *dentry)
+{
+	struct inode *dir = d_inode(dentry);
+	struct dir_context ctx = {
+		.actor = fuse_readdir_hint_actor,
+		.count = INT_MAX,
+	};
+	struct fuse_readdir_args ra;
+	bool locked, eof = false;
+	ssize_t res;
+	loff_t pos;
+
+	do {
+		if (fuse_readdir_hint_stopped(fm))
+			break;
+
+		/*
+		 * As iterate_dir() for each request.  Local changes in between
+		 * are caught by the names generation.
+		 */
+		inode_lock_shared(dir);
+		if (IS_DEADDIR(dir)) {
+			inode_unlock_shared(dir);
+			break;
+		}
+
+		memset(&ra, 0, sizeof(ra));
+		pos = ctx.pos;
+		res = fuse_readdir_args_init(&ra, ff, dir,
+					     FUSE_READDIR_HINT_FLAGS, &ctx, true);
+		if (!res) {
+			ra.ia.ap.args.no_caller = true;
+			locked = fuse_lock_inode(dir);
+			res = fuse_simple_request(fm, &ra.ia.ap.args);
+			fuse_unlock_inode(dir, locked);
+			res = fuse_readdir_args_end(&ra, ff, dentry, &ctx, res,
+						    &eof);
+		}
+		inode_unlock_shared(dir);
+	} while (!res && !eof && ctx.pos != pos && ff->readdir.names);
+}
+
+static void fuse_readdir_hint_work(struct work_struct *work)
+{
+	struct fuse_readdir_hint *hint =
+		container_of(work, struct fuse_readdir_hint, work);
+	struct inode *dir = d_inode(hint->dentry);
+	struct fuse_mount *fm = get_fuse_mount(dir);
+	struct fuse_conn *fc = fm->fc;
+	struct mem_cgroup *old_memcg;
+	struct fuse_file *ff;
+
+	old_memcg = set_active_memcg(hint->memcg);
+	ff = fuse_readdir_hint_open(fm, dir);
+	if (!IS_ERR(ff)) {
+		fuse_readdir_hint_read(fm, ff, hint->dentry);
+		fuse_readdir_names_release(ff);
+		/*
+		 * Wait for the release, so that no request of the pass follows
+		 * fuse_readdir_hint_drain(), which precedes FUSE_DESTROY.
+		 */
+		__fuse_file_release(dir, ff, FUSE_READDIR_HINT_FLAGS, NULL,
+				    true, true);
+	}
+	set_active_memcg(old_memcg);
+
+	clear_bit(FUSE_I_READDIRPLUS_HINT, &get_fuse_inode(dir)->state);
+	dput(hint->dentry);
+	mem_cgroup_put(hint->memcg);
+	kfree(hint);
+
+	atomic_dec(&fc->num_readdir_hints);
+	/* An unmount waiting in fuse_readdir_hint_drain() may free @fm */
+	if (atomic_dec_and_test(&fm->num_readdir_hints))
+		wake_up_var(&fm->num_readdir_hints);
+}
+
+/*
+ * The passes of a connection run on its own workqueue, so that a server that
+ * does not reply only holds up its own passes.
+ */
+static struct workqueue_struct *fuse_readdir_hint_wq(struct fuse_conn *fc)
+{
+	struct workqueue_struct *wq, *old;
+
+	/* Pairs with the cmpxchg() that publishes it */
+	wq = smp_load_acquire(&fc->readdir_wq);
+	if (wq)
+		return wq;
+
+	wq = alloc_workqueue("fuse-readdir", WQ_UNBOUND, FUSE_READDIR_HINT_MAX);
+	if (!wq)
+		return NULL;
+
+	old = cmpxchg(&fc->readdir_wq, NULL, wq);
+	if (old) {
+		destroy_workqueue(wq);
+		return old;
+	}
+	return wq;
+}
+
+/*
+ * Queue a pass for @dir on @wq.  The caller holds fc->killsb, so the mount of
+ * @dir is not yet removed, and fuse_readdir_hint_drain() will wait for the
+ * pass.
+ */
+static int fuse_readdir_hint_queue(struct inode *dir,
+				   struct workqueue_struct *wq)
+{
+	struct fuse_inode *fi = get_fuse_inode(dir);
+	struct fuse_mount *fm = get_fuse_mount(dir);
+	struct fuse_conn *fc = fm->fc;
+	struct fuse_readdir_hint *hint;
+	struct dentry *dentry;
+
+	lockdep_assert_held(&fc->killsb);
+
+	if (!S_ISDIR(dir->i_mode))
+		return -ENOTDIR;
+	if (fuse_is_bad(dir))
+		return -EIO;
+	if (fuse_dir_names_valid(dir))
+		return -EALREADY;
+
+	/*
+	 * The inode can outlive its dentry, eg. after the dcache was shrunk.
+	 * Fail now rather than in the pass, so that the server knows.
+	 */
+	dentry = d_find_alias(dir);
+	if (!dentry)
+		return -ENOENT;
+
+	hint = kzalloc_obj(*hint, GFP_KERNEL_ACCOUNT);
+	if (!hint) {
+		dput(dentry);
+		return -ENOMEM;
+	}
+
+	if (test_and_set_bit(FUSE_I_READDIRPLUS_HINT, &fi->state)) {
+		dput(dentry);
+		kfree(hint);
+		return -EALREADY;
+	}
+	/*
+	 * Each pass holds a dentry and a buffer, so do not queue more than can
+	 * run at a time.
+	 */
+	if (atomic_inc_return(&fc->num_readdir_hints) > FUSE_READDIR_HINT_MAX) {
+		atomic_dec(&fc->num_readdir_hints);
+		clear_bit(FUSE_I_READDIRPLUS_HINT, &fi->state);
+		dput(dentry);
+		kfree(hint);
+		return -EBUSY;
+	}
+	atomic_inc(&fm->num_readdir_hints);
+	hint->dentry = dentry;
+	hint->memcg = get_mem_cgroup_from_current();
+	INIT_WORK(&hint->work, fuse_readdir_hint_work);
+	queue_work(wq, &hint->work);
+	return 0;
+}
+
+/*
+ * Read directory @nodeid in the background, to fill its negative lookup cache.
+ * This runs in the server's write to the device, so it must not wait for the
+ * server.
+ */
+int fuse_readdir_hint(struct fuse_conn *fc, u64 nodeid)
+{
+	struct workqueue_struct *wq;
+	struct inode *dir;
+	int err;
+
+	if (!fc->do_readdirplus)
+		return -EOPNOTSUPP;
+
+	/* Not under fc->killsb, as this takes the CPU hotplug lock */
+	wq = fuse_readdir_hint_wq(fc);
+	if (!wq)
+		return -ENOMEM;
+
+	guard(rwsem_read)(&fc->killsb);
+	dir = fuse_ilookup(fc, nodeid, NULL);
+	if (!dir)
+		return -ENOENT;
+
+	err = fuse_readdir_hint_queue(dir, wq);
+	iput(dir);
+
+	return err;
+}
+
+/*
+ * Wait for the passes on @fm, which hold dentries, to end at unmount.  Called
+ * after @fm was removed from the connection, so that no passes are added.
+ */
+void fuse_readdir_hint_drain(struct fuse_mount *fm)
+{
+	WRITE_ONCE(fm->readdir_hints_stop, true);
+	wait_var_event(&fm->num_readdir_hints, !atomic_read(&fm->num_readdir_hints));
+}
+
 enum fuse_parse_result {
 	FOUND_ERR = -1,
 	FOUND_NONE = 0,
diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index ba8d79c4bcac..c4531926f28c 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1693,6 +1693,7 @@ static void virtio_kill_sb(struct super_block *sb)
 		last = fuse_mount_remove(fm);
 		if (last)
 			virtio_fs_conn_destroy(fm);
+		fuse_readdir_hint_drain(fm);
 	}
 	kill_anon_super(sb);
 	fuse_mount_destroy(fm);
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 32331c9b49b3..6e79b406bc06 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -260,6 +260,7 @@
  *
  *  7.48
  *  - add FOPEN_COMPLETE_DIR and FUSE_HAS_COMPLETE_DIR
+ *  - add FUSE_NOTIFY_READDIRPLUS and struct fuse_notify_readdirplus_out
  */
 
 #ifndef _LINUX_FUSE_H
@@ -733,6 +734,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_PRUNE = 9,
 	FUSE_NOTIFY_BACKING_REMOVE = 10,
 	FUSE_NOTIFY_BACKING_MAP = 11,
+	FUSE_NOTIFY_READDIRPLUS = 12,
 };
 
 /* The read buffer is required to be at least 8k, but may be much larger */
@@ -1178,6 +1180,33 @@ struct fuse_notify_prune_out {
 	uint64_t	spare;
 };
 
+/*
+ * Ask the kernel to read directory @nodeid in the background, with OPENDIR,
+ * READDIRPLUS until the end and RELEASEDIR, as if FOPEN_COMPLETE_DIR was set
+ * for it.  Fails with EBUSY if the kernel is already reading other
+ * directories this way.
+ *
+ * The requests are not made on behalf of any process: OPENDIR and READDIRPLUS
+ * carry FUSE_INVALID_UIDGID as uid and gid, and pid 0.  A server that checks
+ * permissions must allow these requests, eg. by recognizing these ids, or no
+ * listing is made.  As for every release, RELEASEDIR carries uid and gid 0.
+ *
+ * Fails with EALREADY, and does nothing, if the directory already has a valid
+ * listing or is being read, so it can be sent after every negative LOOKUP.
+ * Fails with ENOENT if the kernel has no inode for @nodeid, or no dentry for
+ * it (eg. after the dentry cache was shrunk), and with EOPNOTSUPP if
+ * READDIRPLUS is not enabled.
+ *
+ * The directory is read after this returns, so it does not wait for the
+ * server, and may be sent from a request handler, eg. when handling a LOOKUP
+ * in the directory.
+ */
+struct fuse_notify_readdirplus_out {
+	uint64_t	nodeid;
+	uint32_t	flags;
+	uint32_t	padding;
+};
+
 struct fuse_backing_map {
 	int32_t		fd;
 	uint32_t	flags;
-- 
2.56.0

