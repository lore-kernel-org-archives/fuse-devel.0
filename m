Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE8E3F823D
	for <fuse-devel@lists.linux.dev>; Fri, 26 Jun 2026 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484727; cv=pass; b=OR0Bf4fzgS3QWuVRzxxDkFOwKjPQ+EJiBvbR24VxsHsGgqv7Qe46YaA/ZoxdoaI+BjjNDjR8mDl5SpgQ+xyrKNviGbYX0+eN7No04b21J5YzH+5IgYOC9q4E9zxOYq28EtgRYsRuc+olG4hwl5F7gtD9yabBOeOSLg6Xv1RcvjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484727; c=relaxed/simple;
	bh=JgIm8AA9Zjjh7D1ovkYcsrGMqQbcuYy0WQb7hHxtyiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ke/3nSJrznMotshl/rukrtTZZp9zSY/mEsph6pVTzf7G716eAcgI3hgXWaHc9O+G17loM/mQxKSd3VmfRw1l5EyX/Gb5R3zVl9JIl/2PR6M1e6MXv5TfMtIpAu1JeldVq6/LYJLWNVjUvKyuC5ZbbsJ9wZJq21670R2giqP4/us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzJ+Gl9I; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzJ+Gl9I"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6980ae819f4so1966717a12.0
        for <fuse-devel@lists.linux.dev>; Fri, 26 Jun 2026 07:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782484723; cv=none;
        d=google.com; s=arc-20260327;
        b=AzPfCJjF6eN5LQOh2ysntKXxGHmFjVdwr8hKNw5FVsZO2rF+ZEQOL46NfNRCeReppV
         SKxkJeQnAUyiQ0/WcG+EhTuIAIblD+if1fVMWF3XhwCCGpLNExSUuflCVEi8j7hC0LiR
         fvhx9nFrNLOfGjnAPC6PA9PO6nEcQJdiBIbemZQXiqZBwouWwF6INTbIx3nmBT7/EXM2
         ooKMjgynb7GZfCdKwLzz/Nt9BV07GUbnAn/ooxIv+64IOJK4cTwtwg7UPM0Vloby1n9C
         /iNOl3wNNhsT26E1Na8fRW//PuMNgy4TwzqvSz+GR0mQRmFe782/z0r3+nJU8KBhFadc
         VTJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NZkDpMwweXCiqfWsJ0lGNfjpMrHkvZ0iw15/OwY52I=;
        fh=0Z792nhmCMaVmWEhoREOJK/Y/6iAajq+zq2y/xYONdI=;
        b=TSMKOCoZhliMEld9BvFeLGFVAFYyc4LQ0bWGsphXc8X81f1bpbJTQ9023aWcDIyaMd
         fgoouKEKUXvH8WT0teVOPq+82f3zCGowkTSNqhMZMQbSLCyUzEtnrFG5XN579jse54OH
         rUWnl68v4oYOaPDYoRTsTHpvkaQY5T+TwL/mOKTtrMmHF/uetPd1CtepQbPqsMEQ1opT
         +3ehgtnES3gyRWCXDQUH1UCdde9angZHNdPcaiDVca1U/gAs6nr4SgdxBfTdpvtCzZ2i
         C+psnXjk1qAURpu5StrCktZz52fQt7sVcJD5PguqoF9tVOiZzEEweXxN5Q922pUIT2wf
         sYwQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782484723; x=1783089523; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NZkDpMwweXCiqfWsJ0lGNfjpMrHkvZ0iw15/OwY52I=;
        b=HzJ+Gl9ITN5hWM8IP0ssZBG41dHCBUdG/SiqZu7etbAUGK278+LQ17XK56H+29k8/E
         h4/mqsS9LDJt+JQVimyeRL/oG3SLcInsfom9Qdey9g7USvHv/+Fie35+Ut1uEKdIAV+P
         bE+tARNx29PB//h2txdsP/WgX++sywfoddLpSxeinAEpJVdy7BQz5EGiL0pm7Vl7AH+Z
         hb8E1rMJ5FdW0DSQ2/3fNaRE5fEQAgzUGT32aoBQRr64FB1bVc0bXCmSutMRV7EW4Te2
         oRTlsOd4sSSJXsOi6JrLv3ipgCtHd2UazDGC8tFsABPiHBUosYIJqepdxpCuPrm/PPSX
         /LPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484723; x=1783089523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NZkDpMwweXCiqfWsJ0lGNfjpMrHkvZ0iw15/OwY52I=;
        b=Mwx+Oq9GyimqasunHdyu+ThxT300BtYWyz2OEnWLa8VJbNDsxS5gK26YuhR4t7id67
         X21qDEziwMoW/r/hZUsqMVIa/Bb71xJvrKN+lkBRZBvFuT07l1vNcDOCc3NUciiKCybs
         rRy8MsRNmz74rewZ8ifojINTcvoY2ylvHO8HMmi+KWu3U9ju1hP9IyZwMMmqTmlApmG4
         NyblYlofnTPnQPk610m3r0JykDnqHpL7ePyUKkfAi/YJfbgVdkpyW61qCMEmD3gTBAmE
         CfxxOpryZWl2yKV5y2C6ZzeGVGPjxbEWgouViHZVsvW8WPviGUIBq78RfyvzMVj4k6nH
         NF2g==
X-Forwarded-Encrypted: i=1; AHgh+RrPQnofh2d1RBUXZcOf+IZSqjxxcuXqPuPEdG8MHcQjEtzfGU9/G1A/RwdE+ci+dtj+4pOphmrcttVL@lists.linux.dev
X-Gm-Message-State: AOJu0YxmckDt3OEHufMHARQq097bhXmEPyG+SgKBnJslmcrgIyn3WQ9h
	SF9OO8J2cEGuFel6gsayWXYXxgiqHO7c5FoHlmLcY/fPA71UVpy/bp2M7jv6p41DuHs360Rm7MD
	WqlV6rxnNMM8xT/+M5KwLhyo5pHyZzIs=
X-Gm-Gg: AfdE7cku19VTo1egvoMXLG4eel5rkkvbTlX8+GH5hBFqBxegR/UZZmBFDRMX4FfQoKN
	0Pxmpe6gunkdf6A+8vNUycSdMhRj+nkvREQW/unhNKCwMgxpPcMjs28Ebk0vwgirTjJzi1FalIB
	Jovm/CMJwfykECh7G4u6O2Mjp8oqwtmJDGL9jKsyJUe126Ywn3+PdRqDSrb24Gm6iqVNiDfb8el
	nXj8tT0h5RsldcblCOYBEgvBjQuN3qzOpf2agKyQgkSeKexquKgtz90XELO79kjfTCivW64QuLD
	4zrji0KH21eWLfYZeszwNobTS8QSUoA=
X-Received: by 2002:a05:6402:285:b0:698:3b7b:e488 with SMTP id
 4fb4d7f45d1cf-6983b7bed03mr119681a12.20.1782484722944; Fri, 26 Jun 2026
 07:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com> <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 26 Jun 2026 16:38:31 +0200
X-Gm-Features: AVVi8CeM-RNwVAqreeV_Nwx16YD-9KXFumzlmVWJuV8CDE9zGnWPYkQd3pEMU38
Message-ID: <CAOQ4uxgX0Oqc+KnEHx6n01UfNQAOPfk3m2rQ3vYTGM98HOV0Yw@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: replace passthrough backing-id IDR with a
 counter and hashtable
To: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Joanne Koong <joannelkoong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 2:51=E2=80=AFPM Mahad Ibrahim
<mahad.ibrahim.dev@gmail.com> wrote:
>
> The passthrough backing-id IDR carries a /* FIXME: xarray might be space
> inefficient */ on its idr_alloc_cyclic() call. Replace it with a cyclic
> counter for allocation and a hashtable for lookup.
>
> The hashtable keys are already the set of live ids, so allocation needs
> only a counter: it takes the next value, skipping any already present,
> all under fc->lock. A live-id count makes it return -ENOSPC when full.
>
> The hashtable is allocated lazily when passthrough is negotiated, so it i=
s
> present whenever passthrough is enabled; every dereference is already gat=
ed
> on fc->passthrough, so no NULL checks are added. On allocation failure
> passthrough is left off and the mount continues.
>
> Lookup is now O(chain) rather than the IDR's bounded walk, but runs only =
at
> backing setup, off the read/write path.
>
> Testing
>
> Tested under KASAN and KCSAN in separate builds, since the two cannot be
> enabled together. The workload was passthrough_hp under fio with parallel
> open/close churn; ftrace confirmed concurrent allocation, lookup, and
> removal across CPUs. No KASAN use-after-free and no KCSAN data race in
> fs/fuse/backing.c.
>
> Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
>
> ---
>
> v2:
>  - drop the IDA; allocate with a cyclic counter and resolve collisions
>    via the hashtable's membership check under fc->lock (Miklos)
>  - add a live-id count to bound allocation and return -ENOSPC when full
>
> Uniqueness now comes from the hashtable rather than an allocator that own=
s
> the id space, so this should stay clear of any future 64-bit or
> user-assigned-id work. The id is kept 32-bit and kernel-allocated here.
>
> Lookup uses 256 fixed buckets, so chains lengthen at very high backing
> counts; an rhashtable would keep it flat but adds complexity. The fixed
> table seemed simpler for the expected counts - happy to switch if you'd
> prefer.
>
>  fs/fuse/backing.c | 98 +++++++++++++++++++++++++++++++++++++----------
>  fs/fuse/fuse_i.h  | 31 +++++++++++++--
>  fs/fuse/inode.c   |  8 ++--
>  3 files changed, 111 insertions(+), 26 deletions(-)
>
> diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
> index 472b6afa7dff..77f4d4b00bf4 100644
> --- a/fs/fuse/backing.c
> +++ b/fs/fuse/backing.c
> @@ -35,49 +35,99 @@ void fuse_backing_put(struct fuse_backing *fb)
>
>  void fuse_backing_files_init(struct fuse_conn *fc)
>  {
> -       idr_init(&fc->backing_files_map);
> +       fc->backing_ids_count =3D 0;
> +       fc->backing_files_next_id =3D 1;

looks like your first alloc will be 2.

> +       fc->backing_htable =3D NULL;
>  }
>
>  static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backi=
ng *fb)
>  {
>         int id;
> +       struct fuse_backing *iterator;
>
> -       idr_preload(GFP_KERNEL);
>         spin_lock(&fc->lock);
> -       /* FIXME: xarray might be space inefficient */
> -       id =3D idr_alloc_cyclic(&fc->backing_files_map, fb, 1, 0, GFP_ATO=
MIC);
> +
> +       if (fc->backing_ids_count =3D=3D INT_MAX) {
> +               id =3D -ENOSPC;
> +               goto out;
> +       }
> +
> +retry:
> +       id =3D fc->backing_files_next_id;
> +       fc->backing_files_next_id =3D (id =3D=3D INT_MAX) ? 1 : id + 1;
> +
> +       hash_for_each_possible(fc->backing_htable->backing_files_ht,
> +                              iterator, node, id) {
> +               if (iterator->id =3D=3D id)
> +                       goto retry;
> +       }

The hash table change is good but this allocator I really hate.
I know that Miklos proposed this, but the way it is implemented can
cause soft lockup and in general if you are implementing an allocator
you are probably doing it wrong.

Also I am concerned that with Joanne's backing inode patches,
backing id maps may be a lot more dense and backing id's a lot more
long lived than with backing id's for open/close lifecycle.

I think it was a mistake to provide a kernel allocator for backing ids -
the server is responsible for every other aspect of managing backing files.

Can we still salvage this UAPI?

Maybe:
1. Do not goto retry, instead return -EAGAIN let userspace retry
2. fuse_passthrough_open() can implement the retry loop
3. At least until INT_MAX, EAGAIN is not expected and for existing servers
    with short file open/close lifecycles, EAGAIN should be rare
4. Server/libfuse know exactly which backing ids are allocated,
    so they can use whatever algorithm they like for efficient allocation
5. All we need to do is support server allocated backing id
    and check it against the hash table lookup

+#define FUSE_BACKING_FLAG_SERVER_ID 1
+
 struct fuse_backing_map {
        int32_t         fd;
        uint32_t        flags;
-       uint64_t        padding;
+       uint64_t        id;
 };

It should be a very minimal addition to implement this.
BTW, we make it 64bit for future extensions (such as backing stripe)
although OPEN response still supports only 32bit backing ids.

Will this cause regressions?

Maybe, but I think that the existing users of fuse passthrough are
still pretty close to upstream and not yet in distributed servers (?)
so I hope this will be fine - if not, there are solutions.

Miklos, do you agree?

> +
> +       fb->id =3D id;
> +       hash_add_rcu(fc->backing_htable->backing_files_ht, &fb->node, id)=
;
> +       fc->backing_ids_count++;
> +
> +out:
>         spin_unlock(&fc->lock);
> -       idr_preload_end();
>
> -       WARN_ON_ONCE(id =3D=3D 0);
>         return id;
>  }
>
> +int fuse_backing_htable_alloc(struct fuse_conn *fc)
> +{
> +       struct fuse_backing_htable *ht;
> +
> +       ht =3D kzalloc_obj(struct fuse_backing_htable);
> +       if (!ht)
> +               return -ENOMEM;
> +
> +       hash_init(ht->backing_files_ht);
> +       fc->backing_htable =3D ht;
> +
> +       return 0;
> +}
> +
>  static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,
>                                                    int id)
>  {
> -       struct fuse_backing *fb;
> +       struct fuse_backing *iterator;
> +       struct fuse_backing *fb =3D NULL;
>
>         spin_lock(&fc->lock);
> -       fb =3D idr_remove(&fc->backing_files_map, id);
> +       hash_for_each_possible(fc->backing_htable->backing_files_ht,
> +                              iterator, node, id) {
> +               if (iterator->id =3D=3D id) {
> +                       hash_del_rcu(&iterator->node);
> +                       fb =3D iterator;
> +                       break;

This fb may very likely be alive and referenced by an open
file, so the very least is to set fb->id =3D 0, to make it anonymous,
so debug prints won't show different fb's with the same id.

> +               }
> +       }
> +
> +       if (fb)
> +               fc->backing_ids_count--;
> +
>         spin_unlock(&fc->lock);
>
>         return fb;
>  }
>
> -static int fuse_backing_id_free(int id, void *p, void *data)
> +void fuse_backing_files_free(struct fuse_conn *fc)
>  {
> -       struct fuse_backing *fb =3D p;
> +       struct fuse_backing *fb;
> +       struct hlist_node *tmp;
> +       int bkt;
>
> -       WARN_ON_ONCE(refcount_read(&fb->count) !=3D 1);
> -       fuse_backing_free(fb);
> -       return 0;
> -}
> +       if (!fc->backing_htable)
> +               return;
>
> -void fuse_backing_files_free(struct fuse_conn *fc)
> -{
> -       idr_for_each(&fc->backing_files_map, fuse_backing_id_free, NULL);
> -       idr_destroy(&fc->backing_files_map);
> +       hash_for_each_safe(fc->backing_htable->backing_files_ht,
> +                          bkt, tmp, fb, node) {
> +               hash_del_rcu(&fb->node);
> +               WARN_ON_ONCE(refcount_read(&fb->count) !=3D 1);
> +               fuse_backing_free(fb);
> +       }
> +
> +       kfree(fc->backing_htable);
> +       fc->backing_htable =3D NULL;
>  }
>
>  int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map=
)
> @@ -169,10 +219,18 @@ int fuse_backing_close(struct fuse_conn *fc, int ba=
cking_id)
>
>  struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backi=
ng_id)
>  {
> -       struct fuse_backing *fb;
> +       struct fuse_backing *iterator;
> +       struct fuse_backing *fb =3D NULL;
>
>         rcu_read_lock();
> -       fb =3D idr_find(&fc->backing_files_map, backing_id);
> +       hash_for_each_possible_rcu(fc->backing_htable->backing_files_ht,
> +                                  iterator, node, backing_id) {
> +               if (iterator->id =3D=3D backing_id) {
> +                       fb =3D iterator;
> +                       break;
> +               }
> +       }
> +
>         fb =3D fuse_backing_get(fb);
>         rcu_read_unlock();
>
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 85f738c53122..db4c07a496f0 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -30,6 +30,7 @@
>  #include <linux/pid_namespace.h>
>  #include <linux/refcount.h>
>  #include <linux/user_namespace.h>
> +#include <linux/hashtable.h>
>
>  /** Default max number of pages that can be used in a single read reques=
t */
>  #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
> @@ -94,6 +95,10 @@ struct fuse_backing {
>         /* refcount */
>         refcount_t count;
>         struct rcu_head rcu;
> +
> +       /* ID Allocation */
> +       int id;

move this to the hole next to count.

Mahad,

I am guessing that you are a student doing a summer project?
and you picked up on the FIXME comment?
It's fine, no complaints about that, but TBH, I don't know that there
is huge value to real life users
from making this change, because the measurements were not done on
real life workloads.

However, I do know that there are real users who would benefit from moving =
the
allocator to userspace, so by slightly changing your plan you could also he=
lp
real users and learn how real upstream development works.

Thanks,
Amir.
