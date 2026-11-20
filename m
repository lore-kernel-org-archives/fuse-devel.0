Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=124.126.103.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171989;
	b=uPqUdIx6oIdtWL3ce+yewG3FkUuIDiTnk6fcvBSkbp43gy4tnFgNg/2UTckmex9X6qRe
	 RV+yGhq+XZrjtbnp2WDQ613EVLQ9IJ/oLY0cENqqs53amfCFc0vFdBMj3FX8JCJ56x86W
	 ogPz4MWJ3qnhnOM2UErAPgZrwc8P05dV5ABzFpuIhoXkXtQUqJT6Lw+4Y5jQzF8U7Vkjl
	 yWkrGjY6ygZhIaBkIJJq8xZvqeth4IJszIY78nIY9aBpoPoEoNEBfXnWj4K14FuIV9dJK
	 WkJhVOYgaMR8nRHzwo7bB1lEWq0NaWbVOgJ3R2OcMG3boHvNU/ZOf6xFIL+rlp9c1Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171989;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:X-User:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ie+Cy+DzMt6utm48s6M6rkIcVFNifQbe3phdA6PJuQI=;
	b=VjUz98ewieSlgjrHIUPQtWmk9f83rvvqV9SQJjCFdHecvV0d+KRdR+qESlTUp+Bm21sW
	 bCQM3PMoCGRkV4g2am8Lby6j1H47CwYvUqsoDIyQAslHBZ68nOjIlYZRjT6GMYX9qRVA8
	 Z8hMh+eA4Lti3QhyosaXJLupipyaKlc2Wt9PHPGQTBGN7lpvlRzoIEPsCv0VWO8GrPVj9
	 pBj32StQnogQjQs49VNz87eD74WUlaf5EGAhfENELTGz+W35rlwWgBXUkec4iwsppU2S3
	 ADfrTIjz6/MOKk5ojnKTE4aiqKhVgm1Na1e64wyHAzeDt3HJN6WMhteIK/7A46AW8Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=kylinos.cn;
	arc=none smtp.remote-ip=124.126.103.232
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91902606A320
	for <fuse-devel@lists.linux.dev>; Fri, 20 Nov 2026 10:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91902606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 8b3bc3c2e4d011f19a56ed5b684f684d-20261120
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:a44401b6-35d1-429c-9745-9b3458897c13,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:bc0e57bdc3fb5121980dea64090d6ea7,BulkI
	D:nil,BulkQuantity:0,SF:80|81|82|83|102|136|865|898,TC:nil,Content:0|15|50
	|99,EDM:-3|-100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8b3bc3c2e4d011f19a56ed5b684f684d-20261120
X-User: liwang@kylinos.cn
Received: from [10.42.16.85] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liwang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 473524151; Fri, 20 Nov 2026 18:52:56 +0800
Message-ID: <dfb1cf09-3856-4437-b536-b792783bae37@kylinos.cn>
Date: Fri, 20 Nov 2026 18:52:53 +0800
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fuse: advertise support for DAX mappings
To: Miklos Szeredi <mszeredi@redhat.com>, fuse-devel@lists.linux.dev
References: <20261119140240.1798841-1-mszeredi@redhat.com>
 <20261119140240.1798841-2-mszeredi@redhat.com>
Content-Language: en-GB
From: Li Wang <liwang@kylinos.cn>
In-Reply-To: <20261119140240.1798841-2-mszeredi@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Miklos,

On 19/11/2026 22:02, Miklos Szeredi wrote:
> Reuse the FUSE_HAS_INODE_DAX flag, which previously was only used for the
> virtiofs case.
> 
> The two uses are unrelated: for virtiofs the flag means that host memory
> can be mapped directly into the guest, while here it means that the server
> may back an inode with a dax device opened via FUSE_DEV_IOC_BACKING_OPEN.
> 
> Gate the advertisement on IS_REACHABLE(CONFIG_DEV_DAX_FSDEV), which is
> what fuse_backing_open_file() requires before it accepts a dax device as
> backing; CONFIG_FS_DAX alone is not sufficient.
> 
> Plain fuse servers should check both FUSE_HAS_INODE_DAX and
> FUSE_PASSTHROUGH_V2 before enabling passthrough dax support.
> 
> Stop advertising FUSE_PASSTHROUGH(_V2) in the virtiofs case, which doesn't
> support passthrough mode.
> 
> Note: FUSE_HAS_INODE_DAX flag in the INIT reply is ignored, so it's handled
> slightly differently from the virtiofs case.  This is deliberate.  The
> server needs to check both FUSE_PASSTHROUGH_V2 and FUSE_HAS_INODE_DAX
> before enabling DAX based extent map if it wants to bail or fall back to
> plain I/O mode on kernels not supporting this feature.  A broken server
> that does not check the features yet sets FUSE_ATTR_DAX will result in an
> error on open.  This is not backward compatible, since this flag was
> silently ignored previously, but unlikely to be an issue in real life.
> 
> Fixes: 2fbe4586cff3 ("fuse: add support for opening dax device as backing")
> Signed-off-by: Miklos Szeredi <mszeredi@redhat.com>
> ---
>  fs/fuse/fuse_i.h          | 13 +++++++++++++
>  fs/fuse/inode.c           | 32 +++++++++++++++++++++++++-------
>  fs/fuse/virtio_fs.c       |  1 +
>  include/uapi/linux/fuse.h | 10 ++++++++--
>  4 files changed, 47 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index a033b0bc4576..e0992fcbcc55 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -421,6 +421,7 @@ struct fuse_fs_context {
>  	bool no_req_timeout:1;
>  	bool legacy_opts_show:1;
>  	bool syncfs_capable:1;
> +	bool is_virtiofs:1;

is_virtiofs feels a bit hardcoded, and if a third 
transport case comes along later, a bool won't be enough 
to represent it. Could we consider introducing an enum (e.g., dax_attr) 
to indicate which semantics FUSE_HAS_INODE_DAX / FUSE_ATTR_DAX has on 
a given connection—with a single value per connection such as NONE, 
VIRTIOFS_INODE, or PASSTHROUGH—to make it easier to extend? 
Just a thought for reference, of course.

>  	enum fuse_vdax_mode vdax_mode;
>  	unsigned int max_read;
>  	unsigned int blksize;
> @@ -761,6 +762,9 @@ struct fuse_conn {
>  	/** @sync_init: Is synchronous FUSE_INIT allowed? */
>  	unsigned int sync_init:1;
>  
> +	/** @is_virtiofs: Is this a virtio-fs connection? */
> +	unsigned int is_virtiofs:1;
> +
>  	/** @max_stack_depth: Maximum stack depth for passthrough backing files */
>  	int max_stack_depth;
>  
> @@ -1273,6 +1277,15 @@ void fuse_free_conn(struct fuse_conn *fc);
>  
>  /* dax.c */
>  
> +static inline bool fuse_conn_vdax(struct fuse_conn *fc)
> +{
> +#ifdef CONFIG_FUSE_VDAX
> +	return fc->vdax;
> +#else
> +	return false;
> +#endif
> +}
> +
>  static inline bool fuse_inode_vdax(struct inode *inode)
>  {
>  #ifdef CONFIG_FUSE_VDAX
> diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
> index c6bfc66317ad..af6d9e0af190 100644
> --- a/fs/fuse/inode.c
> +++ b/fs/fuse/inode.c
> @@ -385,7 +385,7 @@ static void fuse_change_attributes_i(struct inode *inode, struct fuse_attr *attr
>  			invalidate_inode_pages2(inode->i_mapping);
>  	}
>  
> -	if (IS_ENABLED(CONFIG_FUSE_VDAX))
> +	if (fuse_conn_vdax(fc))
>  		fuse_vdax_dontcache(inode, attr->flags);
>  }

fuse_vdax_dontcache() forces a new inode when virtiofs per-inode DAX and 
FUSE_ATTR_DAX disagree, but that helper is for a connection with a virtiofs DAX window. 
Gating it on the window leaves passthrough DAX with no update path: a later getattr that 
sets or clears FUSE_ATTR_DAX keeps the cached inode, including address_space operations 
chosen for the old flag. It seems it might be better changed to something like 
the following:

if (fuse_conn_vdax(fc))
	fuse_vdax_dontcache(inode, attr->flags);
else if (IS_ENABLED(CONFIG_FS_DAX) && !fc->is_virtiofs &&
	S_ISREG(inode->i_mode) &&
	((bool)IS_DAX(inode) != (bool)(attr->flags & FUSE_ATTR_DAX)))
		d_mark_dontcache(inode);

Thanks,
Li Wang

  
