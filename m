Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8514F68A7
	for <fuse-devel@lists.linux.dev>; Wed, 30 Sep 2026 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781035; cv=none; b=rCk2kowIZCpmlaVbXMZC1EIIo+oHNYO6NbbkaC4g//3giVH83KeG2+N45FwkgFWvPnUY4znDTdJrjTS958I6AvY2tWN3uHVNUWvbaJ1uOIkzvmq7JT1zf4cSXe/RU6IBqC4oBW8yXGKGIXLmoAErCyBQQHt/SUzYEmDf+9YdM2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781035; c=relaxed/simple;
	bh=T58z8h82iCPkF1Ef4R2lsQZkpDTry7VUeyu6YoWO3rM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHEaAksHPj31zXAACVU483EkUZN2tXoY+afuNInKTI2dZDPhvYbteKV6fiLSckwreaNpvSp+ifzV89cRDrguUtwNGJmLN1u1bVBioo6179wzJa6/MK8BaaVEh0eRqw8DhC+34OFD5II+FFjcW6AJOHZ/PaOIevnxRoSnn/BAN1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AK1akxer; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AK1akxer"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0FDA11F000FF;
	Wed, 30 Sep 2026 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790781020;
	bh=0kOF1QEEY5jryOCoWVvG/G7SND3zoOEYyVP/hqgrytw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AK1akxerhSfzLaOeWFWwghkZyfdyDLKsQLbDkybqMdMtm1r9ds38PvdUy/qXy+Emt
	 RbTemIvcY5jWphXAke+amEngt973qkQUZI3wquff5/TjDY1Ga5DIVSqyO3lKUxaMmk
	 Gz8nDJaPZavB3NJV7fZUgaA/JnZz7FCDXbKBZXnm9w2xspp5kXdgo9IKjazOYvO9JD
	 j7hW43cZLsf+rvQ4qqpR8wY5EOlQKDyz23+5EC6f2/T4tG3VizOTGV0Rz8VizzmEfr
	 R6KaEJPTtKp/K57sTZp1sJIuDZer8ZouPKLlk5Pk2Ty1EbXxZQEV06ydzlZhBtVYGT
	 JlLGrYINlyWmw==
Date: Wed, 30 Sep 2026 08:10:19 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: bernd@bsbernd.com
Cc: fuse-devel@lists.linux.dev, neal@gompa.dev
Subject: Re: [PATCH v3 15/15] move fuse_service_priv.h from include/ to lib/
Message-ID: <20260930151019.GM6253@frogsfrogsfrogs>
References: <20260930-mount-service-bound-open-v3-0-e26c5e4eca4c@bsbernd.com>
 <20260930-mount-service-bound-open-v3-15-e26c5e4eca4c@bsbernd.com>
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-mount-service-bound-open-v3-15-e26c5e4eca4c@bsbernd.com>

On Wed, Sep 30, 2026 at 03:11:09PM +0200, Bernd Schubert via B4 Relay wrote:
> From: Bernd Schubert <bernd@bsbernd.com>
> 
> That had slipped through during review, libfuse convention is to
> have include/ reserved for headers included by applications.
> 
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>

Aha, sorry about missing that. :)
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>

--D

> ---
>  {include => lib}/fuse_service_priv.h | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
> 
> diff --git a/include/fuse_service_priv.h b/lib/fuse_service_priv.h
> similarity index 100%
> rename from include/fuse_service_priv.h
> rename to lib/fuse_service_priv.h
> 
> -- 
> 2.53.0
> 
> 
> 
