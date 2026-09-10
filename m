Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16F55C1B7
	for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789063893; cv=pass; b=WAOu/a4773AzMGUXsFhi0jNQzbvZo3mGINM4PQEsvVpyWotDxu4Wl5xyd8W4e7gsmIe6ilVR5r0F/VlO3XKDwsw+H7rV5zbXBEn96fYc/dunMtuVrV4bdJcTASyqh3viwj+L4syruVcyTSP8rHiuTgvKKnV6/KbtDPCKiKp/76Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789063893; c=relaxed/simple;
	bh=NT0Z/LF1SMhtkavx81DR2GGYYK6aB7iX5ZVgmCMPgvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g58DgkR/ErGuAiG5W3dwiWp3ELuUNpvK2gDgLtMeaYgteaSt63ySwxn/7jCD8PiesCGb6TvsZxrlgFUUcJbSQY4rfKSQ1D/Y8sygBfVofuMLpojf17CnmSQS+MtjROZcAwk6NSCJWt4IUq/TCMp/T0Uvm1Q4TPUrYOqDCOFfrFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmbMiQPp; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmbMiQPp"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae71686cso88709eaf.1
        for <fuse-devel@lists.linux.dev>; Thu, 10 Sep 2026 11:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789063890; cv=none;
        d=google.com; s=arc-20260327;
        b=SgHIJnzOh30L/eBkcM2xO+K3fl+5GGJDoZbf5/9gKu/FVTlZw7EkpZEjsxLtnenuil
         /UXIoD0mHPKeMPDsyHaXu8HC8+Kg8Me0ekD9BYGLzI8OqUskBEIxpZOD83+KOm1D79fh
         urzRNT2Hb8TcZ89M3XwgOJ8i0o2lXPdClNcXNPfopzN5AaQF8OFDkJhjglaKORQ42rlo
         FyqRCGaK4Ejwb0hojv9bYIZJgBFhCC7g/kb94/gjccoF9OLc7DKCXoDt6jqlpC5Kkxpw
         3OW/4WraOUG8Zpnaj9fWCWrp4+jjXJRQcrkn6H+sENJiFLhwT3qEOrcCtF1jA4CnQdTV
         jUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gxuS67QpsgmiVo7SJODgVn7jNGL8PaTVeXELBYXj9Vc=;
        fh=L+5vDT22w++EX1/hcp1QrYFFTrVkpqnAbU4FY0szICM=;
        b=hoBrrFQGuNP0Jmkv7a2mg42rh7wP88jH3sYFBqI6LI+KnhgyZPfQbbAjkihe9mIIXb
         FjgZh05DaCILpbXJYnw/735bHJy47El5vNPHGvFZA5UUmfppOQFanoTdlHnjn2yHUFHm
         URDu8OWlGv7/ci+iL+Z/zX4O67MFCZWtBDGdlxmbZhBbsNrkDYoifgkUU4ThrE5CKf/C
         jUA1ny9dFXDMedZXvN+NVy5UufAlO6zirQGwQYsSS0ajE5YGyor4k07Pt/7dBDs5bwXl
         sxNHeVs0MJQJe8aTWfWCshsOimjIf4x8FK3rcajtpVvr/On3MJXxNpRVfnFiR5F2N6YH
         Rn/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789063890; x=1789668690; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gxuS67QpsgmiVo7SJODgVn7jNGL8PaTVeXELBYXj9Vc=;
        b=WmbMiQPpTjx4/AwV7saQP8HLwY3p92Znu4pF303th/n/PwC5Hr1MA19o5mmnvLJyF0
         EQpeLoEauDFc6Yjfn6m+dI5uiUDQrgqgxr2q9nHpq2dliLY3dLRF3/Ahq29a8v9+F5R7
         LNZNLAqRweeDTJ2MJOfX7s5wgm5l26blAgVBta+Y+doslM0n9h7H3bwM9d6x5HBZ70oY
         38Yu64XtkeQgOVtFvu01dXvN5Knc+gosRn3LtIlfMJfD4B4mC6gaMNXG7mHKFnpP3g2d
         ABh9QYwJulgkK2+OvWsX+XFWlqwQz1vBMIj+ED/OU22ej/Wa4zHftnt6ZmxwjeTA2kjd
         SgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789063890; x=1789668690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxuS67QpsgmiVo7SJODgVn7jNGL8PaTVeXELBYXj9Vc=;
        b=qEX7WHewDbxEUIoSjN6gajuJv7pk3Pg4vqiCSkC8MReSzILu5jSvehI3/OiEYenqFd
         X+CMzqu8hfE4fgY9AWE1YQVMrlJ1scNdpaGld3NXptPzhzjgEB6JXNAJYdSXZC7HxQpX
         hsV161c3hThy3Xr7ntHts0VzAjdQONdgrCOAmFkRBuoGqoi70iOr80mFQls50Ahs1lGU
         2ePVjx0zwOUxUhhQmww/kMezzXWw8VwinVt8S5D5HKsaF34c4U10oWc1sPrs6WGoRRTj
         5t+4LPTgYwPDQ28F7gDpl0eTv/kZU7IhRSPQr2yuEg9z08dlXhWJRp3P7aIsNuZwIaJs
         ollA==
X-Forwarded-Encrypted: i=1; AKwUvBz7c7jVSZXlA1o6Qy33thb/BxmlqNenztzOUzD6y3iiT0emlCR1UxdS4jSu6JoOhSvyQirTikwHhCiO@lists.linux.dev
X-Gm-Message-State: AFuF++n/IrDPFUYSQv3ghsDVR+WqU20px4hibOa4FG4ihlUXtrJ4TUCA
	zhs2JKQYF75gFt4ZKwsWzB5sBh9ASfGqpeDGIV5/JQG1IcCUX/rHfRK7ZbTFHL+N7nyZjsIueOK
	YVc/prDiLvYbgfgu+BdNx7898aKwPu1w=
X-Gm-Gg: AYBFou0E6HGQXN1h54DI7C6HwDi2E4Q8jW0dm68nZid6XvvrBQtkNI298IU6vurfLxF
	6d78/TER6WxgzyzCXEeiSutvzj7tkjMtLaEz4Dh9PljD1hnSYphUE5Z4inZ+WqwGbW4KBhMe7sr
	cOSRDRzUb7ge0x6Mll5i1fymJfCVnHRGbcL5f2NQeK48QEygyTQVhaSDbyeHc5RWqY/nckNXIue
	GN21X33WyAKqDjjiRwkbpolwbQS+kKwTjprzo5M22ap2JKv+APIOksItlMlpyNolj2MNSYXwr81
	tHOR+1dK624e5lN9S//MLmDDWEeytv9ItKm9P7LFV+1nvlW6pnjrDGs=
X-Received: by 2002:a05:6820:55d3:20b0:6b1:ac4f:f708 with SMTP id
 006d021491bc7-6c0bc1d3ad3mr241038eaf.17.1789063890425; Thu, 10 Sep 2026
 11:11:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-0-dacf19cce22b@kernel.org>
 <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
In-Reply-To: <20260908-b4-mmap-prepare-vma-flag-sanify-v1-11-dacf19cce22b@kernel.org>
From: Stephen Smalley <stephen.smalley.work@gmail.com>
Date: Thu, 10 Sep 2026 14:11:18 -0400
X-Gm-Features: AcwNN1XLr_yN2lEzELD3PcXDse2cuW9BBHCwsQpnROCV_SxzPvFmiqhSaiK704I
Message-ID: <CAEjxPJ7hXSi=oLtQPV+7GEvN+txfYwZ-u-v_EysNHM0gSGNrCw@mail.gmail.com>
Subject: Re: [PATCH 11/39] selinux: reject writable opens of policy file, drop
 mmap shared/write check
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, 
	Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-rdma@vger.kernel.org, selinux@vger.kernel.org, 
	linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 4:07=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> The policy file has no write method and is exposed read-only (S_IRUGO in
> selinux_files[]), yet sel_open_policy() performs no open mode check, so a
> CAP_DAC_OVERRIDE caller can open it O_RDWR. Reject FMODE_WRITE at open, a=
s
> kernfs does.
>
> The file can then never be mapped with FMODE_WRITE, so do_mmap() always
> clears VM_MAYWRITE and VM_SHARED for MAP_SHARED mappings and the VM_SHARE=
D
> check in sel_mmap_policy() cannot be reached. Remove it.
>
> This also stops sel_mmap_policy() clearing VM_MAYWRITE on a mapping that =
is
> neither a PFN map nor a mixed map, ahead of the core enforcing that only
> such mappings may do so.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

We should likely do something similar for the other sel_open_*() and
sel_mmap_*() functions too.
In particular, truncation of the status file can bring down systemd
since it is mapped by libselinux.

Acked-by: Stephen Smalley <stephen.smalley.work@gmail.com>

> ---
>  security/selinux/selinuxfs.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/security/selinux/selinuxfs.c b/security/selinux/selinuxfs.c
> index c7d91476971c..545a6f89f9e7 100644
> --- a/security/selinux/selinuxfs.c
> +++ b/security/selinux/selinuxfs.c
> @@ -340,6 +340,9 @@ static int sel_open_policy(struct inode *inode, struc=
t file *filp)
>         struct policy_load_memory *plm =3D NULL;
>         int rc;
>
> +       if (filp->f_mode & FMODE_WRITE)
> +               return -EACCES;
> +
>         rc =3D avc_has_perm(current_sid(), SECINITSID_SECURITY,
>                           SECCLASS_SECURITY, SECURITY__READ_POLICY, NULL)=
;
>         if (rc)
> @@ -424,14 +427,6 @@ static const struct vm_operations_struct sel_mmap_po=
licy_ops =3D {
>
>  static int sel_mmap_policy(struct file *filp, struct vm_area_struct *vma=
)
>  {
> -       if (vma->vm_flags & VM_SHARED) {
> -               /* do not allow mprotect to make mapping writable */
> -               vm_flags_clear(vma, VM_MAYWRITE);
> -
> -               if (vma->vm_flags & VM_WRITE)
> -                       return -EACCES;
> -       }
> -
>         vm_flags_set(vma, VM_DONTEXPAND | VM_DONTDUMP);
>         vma->vm_ops =3D &sel_mmap_policy_ops;
>
>
> --
> 2.55.0
>
