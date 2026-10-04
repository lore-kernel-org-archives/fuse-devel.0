Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F504772BD
	for <fuse-devel@lists.linux.dev>; Sun,  4 Oct 2026 17:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136488; cv=pass; b=aGxpXAmmvSBSx7CyFuqM1UntV+hd6kFm0xy4hyvY0Ghr6ch8FLQJdOMui+6RUOF+UGYMJPj9A/AgYYkSdajZFHxq2r1VF5lYpEbcK6+fbLRQNC83l6c5xZCv6OFwDODgPaeRrNmzZNKir2XqvDD/GmqTRelreG0qlsiqAGB/n8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136488; c=relaxed/simple;
	bh=Tl26wLyoh9tGv5TRbuijPTjsBuOcR1pJwTFpPgYIuM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFVVn18mzz4VInD33xpdi6/9PnUuAnOh2quEEugC8fikurC+AR8W4GPYXa/46wt9Bjx+oZwKBkc10HXqQlDZJdInslowS1JQNamym8C+u91tRL4FEcXk7vOZRwI/8JL0/wo80Kj1jtZXVCfoTwDkIACPVYJ2Bja7QzL9Hyvz+30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tyC0thNl; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tyC0thNl"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5351f9dbfe0so97991cf.1
        for <fuse-devel@lists.linux.dev>; Sun, 04 Oct 2026 10:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791136479; cv=none;
        d=google.com; s=arc-20260327;
        b=UPXX7LoFixUv7jE09X3YoUdZooQyhZH74KzaRm1rEyHXiyuOtPfSno6i4EJYBv+HBB
         Asa3A5X11+x27La4tBJvVjdqCELMt3zVAkibn42lCCw1hoAXEP5rr2WI/Y209yDPP6kV
         8Fgo5bLakMGcJe5LC4YFp1flzB/DwOmCyxhXXGGzycdVHmWGSUywOlH0TqwZOZpR7A5z
         HbAHFouWXQwQvNVVmeGoYG3Ue7ofw9+RWoq7AP7vjjQW7e1B7A67goKUrD2/b3k6Qmh4
         jkH+QviRlSBgsv0kaYcUrDqcRn+4CPeBREikpifUDKZH9lzwIU1G4YXu1kX3PXbTp1uM
         Pu6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fdcss6XzKw26cI5TyCzpDNu6o5ifWClMegsH9OJNnig=;
        fh=A7a74QWMAaaYLB9WB/VEF0K+xEczsgjUc2FxrDzITmY=;
        b=kI+WSFjZDeYp7CW4BDyxrGUS8bK3eQnGGlGCj4f7Rzy4WZyAlNs045VbCjm3dpYrIy
         A/WTMXBu7uxLWT5xiw9CWOSNXdwFpTcVL+gJ8SVfBZowzb/z8nSqTwb2HMD/vVn+vS1r
         uwcTgMUikhAHYWxGCxahzrERNYaO/9rbLrSh8Yy5+18YwI3qSZVtA0+DwzlAJAXKxDLO
         O6BvwhsOOoGhyYCZ0C6wen72Iwo79TwxH74Dc8SCPHtPJqQSwMlD15dGYVtUik4Sg36D
         ttAx5Vx9EZ0SBZohZoG/Xny7sN0mg+rqTELGZr0QEfJo4kDSz/OyRIyXdeZMBxEIaRt9
         ajTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791136479; x=1791741279; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fdcss6XzKw26cI5TyCzpDNu6o5ifWClMegsH9OJNnig=;
        b=tyC0thNl0hdu2uxa8+cY79/hsPDSKdlia9E+POwXVkhqtb6/4/um8pyVO7Biraf8nF
         aVo3zN2u49Ugk4kX3qWB8LTCEoE1T04WYPqtRC3518SLIWfQg0fu0FpdeUwEIcPl9XIF
         pINRKPAjIPuvMKmhilVX/bCJEdUuv9gUhhFbxHIxGd5jjdRJC7nqSoE996AnZj2f32zp
         i2O9AMDytWwYsZhYRdVOLLviltVIldklUnbe1zSq0e5eOFo8A3sDzIJFESoGTrj8wLDs
         jdah+/W4GrB8F8+LMfe+0BKEaAbBUTkZOhJ8GfkADK7KQrFAQVOxuAICul/pHdtqieHO
         UErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791136479; x=1791741279;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fdcss6XzKw26cI5TyCzpDNu6o5ifWClMegsH9OJNnig=;
        b=SKXb6r56OOhf5b9gygSPiMy04ecR6qo3O9wBKlTto+VPckJHJRuwZgUnXGVppjmG6j
         eekZwfOvm5nRx896Ub4otlYsPmoFB/tndtjAlqiHZcbhh0WRKS5CPAO159rxjLznbQy8
         OT2iz/TC78At01pIX3BiIKF3IT59Z4KqbQ2EB72Di3boNU4ku894oYU/ncLwx4J1HzaD
         lXpACqBzxXpDm0UnejexYYFF4CLp1MFgJ5l243Ynw7L4se6ZV/m2UAftkeF5ypiQfWto
         9AQRI5/kJprPF57oOMWvppWrakjM3TUSvreW6Txk4cyEKZ0uaRsDBci052nO3vp0yy5T
         rPKg==
X-Forwarded-Encrypted: i=1; AKwUvBzFjVsKGZtJpSUkqLFl2wUdQekU9bw9m+oCYv0m+3bwrH5BIG7gvC4j5bBTuSScUUJq0RuNk9VV7xMZ@lists.linux.dev
X-Gm-Message-State: AFuF++lfFQBJs9XHx8YoOTojqxpTC5cttYzVMr1lICwpFyearycwz2J6
	QACxV+qre4uzG4cHZtQTq38bmU2OVFTPLYrmU9PCWDsrFgMRRAo5A8zhwj1Obe3T/yKPE/a7mIu
	p9P/ooEPf8c+9en8yJi0VuRej4wEezax+EMsuV5TL
X-Gm-Gg: AYBFou3gZVdPZG+BbhuFrkyV4R0B/chL2ZD5LnaekKzHrwT7ED9jsfx91Gbj4npHou4
	BmF7Uy87zGjahO7b9KBsuQo67jsTVuEa/i+dZ3BDcUgNxqQLLJxTUNFtteg3Bw0wP2h8Q0cQ2UA
	9rqrK4Q29GvHO/GWlxb2yqBGcok0iVKEJJp3oBfhVYUcHIWQm0pdpfyzKIZklIh7DTZ0Lw+x+Z6
	vpWl9s67/XKaN+XcBRKLlRqiMQBZxTAWM9ySc0UEzLnEFZHemMFo1o7VoOpfiU4xKO9ogmu++UH
	QYk1yl+3fLzO1qxxrTgZIVDeMspIVoxYaH5ZFf7jLoYpW2HXfFpjq9NF
X-Received: by 2002:ac8:7e89:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-53514799503mr16690141cf.8.1791136478525; Sun, 04 Oct 2026
 10:54:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-0-a1f052500fd7@kernel.org>
 <20261003-b4-mmap-prepare-vma-flag-sanify-v4-17-a1f052500fd7@kernel.org>
In-Reply-To: <20261003-b4-mmap-prepare-vma-flag-sanify-v4-17-a1f052500fd7@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 4 Oct 2026 10:54:27 -0700
X-Gm-Features: AclHuK-Rg0T0ymL6HRAgNQPZX5D4YqOng-e9RJRoGVP6zixq0eakV-RXfXJpvBY
Message-ID: <CAJuCfpHM9-VY97TD8yXCEcWirLHik7UPf2_gv5CzqEexD2hbHg@mail.gmail.com>
Subject: Re: [PATCH v4 17/38] scsi: sg: convert mmap hook to mmap_prepare and rework
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, 
	Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
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
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, 
	selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	fuse-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 6:39=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> Move from the deprecated mmap hook to the new mmap_prepare hook.
>
> We are mapping kernel pages here, so use the discontiguous kernel mapping
> mmap action to do so.
>
> Unwind the rather confusing loop and instead map as many pages as we can =
at
> one time.
>
> Note that we do not need to pay attention to rsv_schp->k_use_sg here, as
> the pages are populated for the length of the buffer at
> rsv_schp->page_order granularity as compound pages.
>
> The discontiguous kernel page mapping logic handles the compound pages fo=
r
> us.
>
> sfp->mmap_called keeps the buffer stable for us. As before it is never
> cleared, so a failed mmap also leaves it set.
>
> We also remove some useless vma, vma->vm_file NULL checks - these will
> always be non-NULL if you reached the mmap hook logic.
>
> We retain log output for consistency, but change what's output on page
> mapping to indicate that sg_discontig_get() does the work now.
>
> Note that we drop the VMA_IO_BIT flag for the VMA here. It was never
> necessary as we invoke alloc_pages() which gives us refcounted folios tha=
t
> are fine for GUP to access (VMA_IO_BIT would prevent that).
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

The code looks correct but I must disclaim that I have no experience
with this driver.

Reviewed-by: Suren Baghdasaryan <surenb@google.com>


> ---
>  drivers/scsi/sg.c | 115 ++++++++++++++++++++++++------------------------=
------
>  1 file changed, 51 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/scsi/sg.c b/drivers/scsi/sg.c
> index 5408f002e6c0..3f9e08725602 100644
> --- a/drivers/scsi/sg.c
> +++ b/drivers/scsi/sg.c
> @@ -1212,85 +1212,72 @@ sg_fasync(int fd, struct file *filp, int mode)
>         return fasync_helper(fd, filp, mode, &sfp->async_qp);
>  }
>
> -static vm_fault_t
> -sg_vma_fault(struct vm_fault *vmf)
> +static int sg_discontig_init(void *vm_private_data, void **private)
>  {
> -       struct vm_area_struct *vma =3D vmf->vma;
> -       Sg_fd *sfp;
> -       unsigned long offset, len, sa;
> -       Sg_scatter_hold *rsv_schp;
> -       int k, length;
> -
> -       if ((NULL =3D=3D vma) || (!(sfp =3D (Sg_fd *) vma->vm_private_dat=
a)))
> -               return VM_FAULT_SIGBUS;
> -       rsv_schp =3D &sfp->reserve;
> -       offset =3D vmf->pgoff << PAGE_SHIFT;
> -       if (offset >=3D rsv_schp->bufflen)
> -               return VM_FAULT_SIGBUS;
> -       SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sfp->parentdp,
> -                                     "sg_vma_fault: offset=3D%lu, scatg=
=3D%d\n",
> -                                     offset, rsv_schp->k_use_sg));
> -       sa =3D vma->vm_start;
> -       length =3D 1 << (PAGE_SHIFT + rsv_schp->page_order);
> -       for (k =3D 0; k < rsv_schp->k_use_sg && sa < vma->vm_end; k++) {
> -               len =3D vma->vm_end - sa;
> -               len =3D (len < length) ? len : length;
> -               if (offset < len) {
> -                       struct page *page =3D rsv_schp->pages[k] + (offse=
t >> PAGE_SHIFT);
> -                       get_page(page); /* increment page count */
> -                       vmf->page =3D page;
> -                       return 0; /* success */
> -               }
> -               sa +=3D len;
> -               offset -=3D len;
> +       const unsigned long req_sz =3D (unsigned long)*private;
> +       Sg_fd *sfp =3D vm_private_data;
> +       Sg_scatter_hold *rsv_schp =3D &sfp->reserve;
> +       int err =3D 0;
> +
> +       mutex_lock(&sfp->f_mutex);
> +       if (req_sz > rsv_schp->bufflen) {
> +               err =3D -ENOMEM;  /* cannot map more than reserved buffer=
 */
> +               goto out;
> +       }
> +       sfp->mmap_called =3D 1; /* Prevents changes to buffer size. */
> +out:
> +       mutex_unlock(&sfp->f_mutex);
> +       return err;
> +}
> +
> +static int
> +sg_discontig_get(struct discontig_kernel_page_state *state)
> +{
> +       Sg_fd *sfp =3D state->vm_private_data;
> +       Sg_scatter_hold *rsv_schp =3D &sfp->reserve;
> +       const unsigned int order =3D rsv_schp->page_order;
> +       const pgoff_t nr_pages =3D state->nr_pages_mapped;
> +
> +       if (nr_pages >=3D (rsv_schp->bufflen >> PAGE_SHIFT)) {
> +               discontig_kernel_map_abort(state);
> +               return 0;
>         }
>
> -       return VM_FAULT_SIGBUS;
> +       SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sfp->parentdp,
> +                                     "%s: offset=3D%lu, scatg=3D%d\n", _=
_func__,
> +                                     nr_pages << PAGE_SHIFT, rsv_schp->k=
_use_sg));
> +
> +       discontig_kernel_map_page(state, rsv_schp->pages[nr_pages >> orde=
r]);
> +       return 0;
>  }
>
> -static const struct vm_operations_struct sg_mmap_vm_ops =3D {
> -       .fault =3D sg_vma_fault,
> +static const struct discontig_kernel_page_ops sg_discontig_ops =3D {
> +       .init =3D sg_discontig_init,
> +       .get =3D sg_discontig_get,
>  };
>
>  static int
> -sg_mmap(struct file *filp, struct vm_area_struct *vma)
> +sg_mmap_prepare(struct vm_area_desc *desc)
>  {
> -       Sg_fd *sfp;
> -       unsigned long req_sz, len, sa;
> -       Sg_scatter_hold *rsv_schp;
> -       int k, length;
> -       int ret =3D 0;
> +       Sg_fd *sfp =3D desc->file->private_data;
> +       const unsigned long req_sz =3D vma_desc_size(desc);
>
> -       if ((!filp) || (!vma) || (!(sfp =3D (Sg_fd *) filp->private_data)=
))
> +       if (!sfp)
>                 return -ENXIO;
> -       req_sz =3D vma->vm_end - vma->vm_start;
> +
>         SCSI_LOG_TIMEOUT(3, sg_printk(KERN_INFO, sfp->parentdp,
>                                       "sg_mmap starting, vm_start=3D%p, l=
en=3D%d\n",
> -                                     (void *) vma->vm_start, (int) req_s=
z));
> -       if (vma->vm_pgoff)
> +                                     (void *) desc->start, (int) req_sz)=
);
> +
> +       if (desc->pgoff)
>                 return -EINVAL; /* want no offset */
> -       rsv_schp =3D &sfp->reserve;
> -       mutex_lock(&sfp->f_mutex);
> -       if (req_sz > rsv_schp->bufflen) {
> -               ret =3D -ENOMEM;  /* cannot map more than reserved buffer=
 */
> -               goto out;
> -       }
>
> -       sa =3D vma->vm_start;
> -       length =3D 1 << (PAGE_SHIFT + rsv_schp->page_order);
> -       for (k =3D 0; k < rsv_schp->k_use_sg && sa < vma->vm_end; k++) {
> -               len =3D vma->vm_end - sa;
> -               len =3D (len < length) ? len : length;
> -               sa +=3D len;
> -       }
> +       vma_desc_set_flags(desc, VMA_DONTEXPAND_BIT, VMA_DONTDUMP_BIT);
> +       desc->private_data =3D sfp;
>
> -       sfp->mmap_called =3D 1;
> -       vm_flags_set(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP);
> -       vma->vm_private_data =3D sfp;
> -       vma->vm_ops =3D &sg_mmap_vm_ops;
> -out:
> -       mutex_unlock(&sfp->f_mutex);
> -       return ret;
> +       mmap_action_map_discontig_kernel_pages(desc, (void *)req_sz,
> +                                              &sg_discontig_ops);
> +       return 0;
>  }
>
>  static void
> @@ -1415,7 +1402,7 @@ static const struct file_operations sg_fops =3D {
>         .unlocked_ioctl =3D sg_ioctl,
>         .compat_ioctl =3D compat_ptr_ioctl,
>         .open =3D sg_open,
> -       .mmap =3D sg_mmap,
> +       .mmap_prepare =3D sg_mmap_prepare,
>         .release =3D sg_release,
>         .fasync =3D sg_fasync,
>  };
>
> --
> 2.55.0
>
