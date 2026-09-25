Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B8C47B423
	for <fuse-devel@lists.linux.dev>; Fri, 25 Sep 2026 22:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790374410; cv=none; b=n8UQcfPDswCkz3xYs0ZnQeV+QP+63+22ofPz7Q3/1uDogX9wJIVwQ4dNWpt3qsV9aSsez5YqfwA5mRG8mRxYgZWGTwZ8d1rHlorGSyfftwBFBXyT5AwqLB06RBFntIv2wbp2IfCwqKz8ZlQDoUAGgHUJPFVytkvZBq2r3pqomWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790374410; c=relaxed/simple;
	bh=vUsH8JBgVt4x2UmmbDNyh0vJCmBp4TnML/qLsEaFahQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LYeYzQlEO7B0XmacOG4ZnWMGbMvLCNMHHb9n7uhk6WZz58mGpKRx1H4f7DApWX0RYPYOBHdb+PMGeIBlah6H/JSsdgbz26EcoQMMVwfPAf0YaBsufL3ktI8J2EmXyFcuPdzxTD0LjYbwk46T4uVTc+1yC4O9y6WEq8V3bodKhgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WYlPYM3R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WYlPYM3R"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8E3241F000FF;
	Fri, 25 Sep 2026 22:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790374408;
	bh=6DbhYQ9nM30PPtu/AjdgW8fQW9BRhNFltcodm1TuXW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WYlPYM3RH04Dy/1EjoYiwXFD/5vtbxjWbOycGmPYmzLJ3ngOR9luJYL4Jsu7qz7+w
	 Li9lIuzLYFkjWm49PBqgs1IZUuujxgXvDVMysBFRD81TmzmuP6mopU5u6PWbJ8EIQU
	 ucqdi0xqI+esg2UN6r55dDSmNLtja2Rte/7MQjDqJN+DWH+8j9Rs3jmpMYtZGfbLnV
	 U067L4Ah7eioMKC7jIKTZtUP3Gv5bj34wbuHracCg2SH4EUID9H20P2F5Noo8LQGGp
	 QwHL6QgUewSto181xEyFTQKKJWNh16upad6P13AvSOY/Y2rVj6KFAlXV3l8YesHvwP
	 k8d+SDWRvIkDw==
Date: Fri, 25 Sep 2026 15:13:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev
Subject: Re: [PATCH 06/10] example/single_file: take no sector size from a
 regular backing file
Message-ID: <20260925221327.GV6253@frogsfrogsfrogs>
References: <20260925-mount-service-bound-open-v1-0-bbf1a84c7995@bsbernd.com>
 <20260925-mount-service-bound-open-v1-6-bbf1a84c7995@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mount-service-bound-open-v1-6-bbf1a84c7995@bsbernd.com>

On Fri, Sep 25, 2026 at 12:23:34AM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> single_file_configure() took the sector size of a regular backing file
> from st_blksize, and refused to start when it was larger than the page
> size. For a regular file st_blksize is only a preferred I/O size, and
> the file is not opened with O_DIRECT, so any offset works. NFS reports
> 1 MiB there, so service_ll and service_hl failed on an image on NFS
> with "lba size 1048576 smaller than blocksize 4096".
> 
> Assisted-by: LLM
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
>  example/single_file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/example/single_file.c b/example/single_file.c
> index 59dbc6bbac5e..4260ecf3c5f5 100644
> --- a/example/single_file.c
> +++ b/example/single_file.c
> @@ -887,7 +887,8 @@ int single_file_configure(const char *device, const char *filename)
>  		perror(device);
>  		return -1;
>  	}
> -	lbasize = stbuf.st_blksize;
> +	/* A regular file takes any offset; its st_blksize is only an I/O hint */
> +	lbasize = S_ISBLK(stbuf.st_mode) ? stbuf.st_blksize : 1;

You could just flow that into the S_ISBLK clause below, but I don't feel
strongly either way.  The justification is reasonable so
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D


>  	backing_size = stbuf.st_size;
>  
>  	if (S_ISBLK(stbuf.st_mode)) {
> 
> -- 
> 2.53.0
> 
> 
> 
